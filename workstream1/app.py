from flask import Flask, request, render_template
import mariadb

app = Flask(__name__)
app.config["DEBUG"] = True

# Configuration used to connect to MariaDB
config = {
    'host': '127.0.0.1',
    'port': 3306,
    'user': 'root',
    'password': 'new_password',
    'database': 'CMFPortfolio'
}

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        form_data = request.form

        portfolio_data = (
            form_data['PortfolioID'],
            form_data['PortfolioName'],
            form_data['PortfolioYear']
        )

        project_data = (
            form_data['PortfolioID'],
            form_data['txtPPN'],
            form_data['txtStreet'],
            form_data['txtCity'],
            form_data['txtState'],
            form_data['txtZIP']
        )

        metrics_data = [
            (1, form_data['txtUnder30'], form_data['projectName']),
            (2, form_data['txtUnder50'], form_data['projectName']),
            (3, form_data['txtUnder60'], form_data['projectName']),
            (4, form_data['txtUnder80'], form_data['projectName']),
            (5, form_data['txtUnder120'], form_data['projectName']),
            (6, form_data['txtAbove120'], form_data['projectName']),
            (7, form_data['txtNoCmfClf'], form_data['projectName']),
            (8, form_data['txtPrivCash'], form_data['projectName']),
            (9, form_data['txtGovCash'], form_data['projectName']),
            (10, form_data['txtCMFLoan'], form_data['projectName']),
        ]

        # Connect to MariaDB
        conn = mariadb.connect(**config)
        cur = conn.cursor()

        # Check if portfolio already exists
        cur.execute("SELECT * FROM Portfolios WHERE PortfolioID = %s", (portfolio_data[0],))
        if cur.fetchone() is None:
            # Insert new portfolio if it doesn't exist
            cur.execute("INSERT INTO Portfolios(PortfolioID, PortfolioName, PortfolioYear) VALUES (%s, %s, %s)", portfolio_data)

        # Insert the new project
        cur.execute("INSERT INTO Projects(PortfolioID, txtPPN, txtAddr1, txtAddr2, txtCity, txtState, txtZIP) VALUES (%s, %s, %s, %s, %s, %s, %s)", project_data)
        
        for metric in metrics_data:
            cur.execute("INSERT INTO ProjectMetrics(MetricID, MetricValue, txtPPN) VALUES (%s, %s, %s)", metric)

        # 1. Check for 45% Very Low Income Families
        cur.execute("""
            SELECT 
                (SUM(CASE WHEN MetricID = 1 THEN MetricValue ELSE 0 END) + 
                SUM(CASE WHEN MetricID = 2 THEN MetricValue ELSE 0 END)) /
                SUM(CASE WHEN MetricID IN (1, 2, 3, 4, 5, 6) THEN MetricValue ELSE 0 END) * 100 AS PercentageForVeryLowIncome
            FROM ProjectMetrics;
        """)
        result = cur.fetchone()
        if result[0] < 45:
            print("Failed Requirement: Less than 45% of rental affordable housing units for Very Low Income Families.")

        # 2. Check for total project cost being 10x the CMF award
        cur.execute("""
            SELECT 
                SUM(TotalProjectCost) / (SELECT 10 * SUM(CASE WHEN MetricID = 10 THEN MetricValue ELSE 0 END) FROM ProjectMetrics) AS CostToCMFRatio
            FROM Projects;
        """)
        result = cur.fetchone()
        if result[0] < 1:
            print("Failed Requirement: Total project cost is not 10x the amount of the CMF award.")

        # 3. Check for 60% in Areas of Economic Distress
        cur.execute("""
            SELECT 
                SUM(CASE WHEN AreaOfEconomicDistress = 'Y' THEN TotalProjectCost ELSE 0 END) / 
                SUM(TotalProjectCost) * 100 AS PercentageInEconomicDistress
            FROM Projects
            JOIN ProjectMetrics ON Projects.txtPPN = ProjectMetrics.txtPPN AND ProjectMetrics.MetricID = 7;
        """)
        result = cur.fetchone()
        if result[0] < 60:
            print("Failed Requirement: Less than 60% of rental affordable housing units are in Areas of Economic Distress.")

        # 4. Check for each project having 20% for Low Income Families
        cur.execute("""
            SELECT 
                txtPPN, 
                (SUM(CASE WHEN MetricID IN (1,2,3,4) THEN MetricValue ELSE 0 END) / 
                SUM(CASE WHEN MetricID = 7 THEN MetricValue ELSE 0 END)) * 100 AS PercentageForLowIncome
            FROM ProjectMetrics
            GROUP BY txtPPN;
        """)
        projects = cur.fetchall()
        for project in projects:
            if project[1] < 20:
                print(f"Project {project[0]} Failed Requirement: Less than 20% of affordable housing units for Low Income Families.")

        # Close the connection and commit changes
        conn.commit()
        cur.close()

        return 'success'
    return render_template('form.html')

if __name__ == '__main__':
    app.run(debug=True)

