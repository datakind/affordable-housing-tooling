import requests
from flask import Flask, request, render_template
import mariadb

app = Flask(__name__)
app.config["DEBUG"] = True

# Configuration used to connect to MariaDB
config = {
    "host": "127.0.0.1",
    "port": 3306,
    "user": "root",
    "password": "new_password",
    "database": "CMFPortfolio",
}


def get_tract_number(street, city, state, zipcode):
    address = f"{street}, {city}, {state} {zipcode}"
    base_url = "https://geocoding.geo.census.gov/geocoder/geographies/onelineaddress"

    parameters = {
        "address": address,
        "benchmark": "Public_AR_Census2020",
        "vintage": "Census2010_Census2020",
        "format": "json",
    }

    print("Address = " + address + "\n")
    response = requests.get(base_url, params=parameters)

    if response.status_code == 200:
        data = response.json()
        if data.get("result", {}).get("addressMatches"):
            tract = (
                data["result"]["addressMatches"][0]
                .get("geographies", {})
                .get("Census Tracts", [{}])[0]
                .get("TRACT", "")
            )
            return tract
    else:
        print("API failed.")
        print(
            response.content
        )  # This will print the content of the response, which might contain error details.
    return None


@app.route("/", methods=["GET", "POST"])
def index():
    if request.method == "POST":
        form_data = request.form

        portfolio_data = (
            form_data["PortfolioID"],
            form_data["PortfolioName"],
            form_data["PortfolioYear"],
        )

        project_data = (
            form_data["PortfolioID"],
            form_data["txtPPN"],
            form_data["txtStreet"],
            form_data["txtCity"],
            form_data["txtState"],
            form_data["txtZIP"],
        )

        metrics_data = [
            (1, form_data["txtUnder30"], form_data["txtPPN"]),
            (2, form_data["txtUnder50"], form_data["txtPPN"]),
            (3, form_data["txtUnder60"], form_data["txtPPN"]),
            (4, form_data["txtUnder80"], form_data["txtPPN"]),
            (5, form_data["txtUnder120"], form_data["txtPPN"]),
            (6, form_data["txtAbove120"], form_data["txtPPN"]),
            (7, form_data["txtNoCmfClf"], form_data["txtPPN"]),
            (8, form_data["txtPrivCash"], form_data["txtPPN"]),
            (9, form_data["txtGovCash"], form_data["txtPPN"]),
            (10, form_data["txtCMFLoan"], form_data["txtPPN"]),
        ]

        # Fetch the tract number using the address details
        tract_number = get_tract_number(
            form_data["txtStreet"],
            form_data["txtCity"],
            form_data["txtState"],
            form_data["txtZIP"],
        )
        print(f"Tract number: {tract_number}")

        # Connect to MariaDB
        conn = mariadb.connect(**config)
        cur = conn.cursor()

        # Check if portfolio already exists
        cur.execute(
            "SELECT * FROM Portfolios WHERE PortfolioID = %s", (portfolio_data[0],)
        )
        if cur.fetchone() is None:
            # Insert new portfolio if it doesn't exist
            cur.execute(
                "INSERT INTO Portfolios(PortfolioID, PortfolioName, PortfolioYear) VALUES (%s, %s, %s)",
                portfolio_data,
            )

        # Insert the new project
        cur.execute(
            "INSERT INTO Projects(PortfolioID, txtPPN, txtStreet, txtCity, txtState, txtZIP) VALUES (%s, %s, %s, %s, %s, %s)",
            project_data,
        )

        for metric in metrics_data:
            cur.execute(
                "INSERT INTO ProjectMetrics(MetricID, MetricValue, txtPPN) VALUES (%s, %s, %s)",
                metric,
            )

        # Calculate the total project cost
        cur.execute(
            """
            SELECT 
                SUM(CASE WHEN MetricID = 7 THEN MetricValue ELSE 0 END) 
                + SUM(CASE WHEN MetricID = 8 THEN MetricValue ELSE 0 END)
                + SUM(CASE WHEN MetricID = 9 THEN MetricValue ELSE 0 END) AS TotalProjectCost
            FROM ProjectMetrics;
            """
        )
        total_cost = cur.fetchone()

        # Calculate the total number of units
        cur.execute(
            """
            SELECT 
                SUM(CASE WHEN MetricID IN (1, 2, 3, 4, 5, 6) THEN MetricValue ELSE 0 END) AS TotalUnits
            FROM ProjectMetrics;
            """
        )
        total_units = cur.fetchone()

        # Calculate the total number of units for very low income families
        cur.execute(
            """
            SELECT 
                SUM(CASE WHEN MetricID IN (1, 2) THEN MetricValue ELSE 0 END) AS VeryLowIncomeUnits
            FROM ProjectMetrics;
            """
        )
        very_low_income_units = cur.fetchone()

        # Calculate the total number of units for low income families
        cur.execute(
            """
            SELECT 
                SUM(CASE WHEN MetricID IN (1, 2, 3, 4) THEN MetricValue ELSE 0 END) AS LowIncomeUnits
            FROM ProjectMetrics;
            """
        )
        low_income_units = cur.fetchone()

        requirements = []

        # 1. Check for 45% Very Low Income Families
        cur.execute(
            """
            SELECT 
                (SUM(CASE WHEN MetricID = 1 THEN MetricValue ELSE 0 END) + 
                SUM(CASE WHEN MetricID = 2 THEN MetricValue ELSE 0 END)) /
                SUM(CASE WHEN MetricID IN (1, 2, 3, 4, 5, 6) THEN MetricValue ELSE 0 END) * 100 AS PercentageForVeryLowIncome
            FROM ProjectMetrics;
        """
        )
        result = cur.fetchone()
        if result[0] < 45:
            requirements.append(
                "Failed Requirement: Less than 45% of rental affordable housing units for Very Low Income Families."
            )
        # 2. Check for total project cost being 10x the CMF award
        cur.execute(
            """
            SELECT 
                (SUM(CASE WHEN MetricID = 7 THEN MetricValue ELSE 0 END) 
                + SUM(CASE WHEN MetricID = 8 THEN MetricValue ELSE 0 END)
                + SUM(CASE WHEN MetricID = 9 THEN MetricValue ELSE 0 END))
                / (10 * SUM(CASE WHEN MetricID = 10 THEN MetricValue ELSE 0 END)) AS CostToCMFRatio
            FROM ProjectMetrics;
        """
        )
        result = cur.fetchone()
        if result[0] < 1:
            requirements.append(
                "Failed Requirement: Total project cost is not 10x the amount of the CMF award."
            )
        # 3. Check for 60% in Areas of Economic Distress

        # 4. Check for each project having 20% for Low Income Families
        cur.execute(
            """
            SELECT 
                txtPPN, 
                (SUM(CASE WHEN MetricID IN (1,2,3,4) THEN MetricValue ELSE 0 END) / 
                SUM(CASE WHEN MetricID = 7 THEN MetricValue ELSE 0 END)) * 100 AS PercentageForLowIncome
            FROM ProjectMetrics
            GROUP BY txtPPN;
        """
        )
        projects = cur.fetchall()
        for project in projects:
            if project[1] < 20:
                requirements.append(
                    f"Project {project[0]} Failed Requirement: Less than 20% of affordable housing units for Low Income Families."
                )

        # Close the connection and commit changes
        conn.commit()
        cur.close()

        return render_template(
            "success.html",
            total_cost=total_cost,
            total_units=total_units,
            very_low_income_units=very_low_income_units,
            low_income_units=low_income_units,
            requirements=requirements,
        )
    return render_template("form.html")


if __name__ == "__main__":
    app.run(debug=True)
