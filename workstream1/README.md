# Affordable Housing Tooling - Workstream 1

This repository contains tools and resources specific to Workstream 1 of the Affordable Housing project. Follow the instructions below to set up and run the project locally.

## Prerequisites

Before you begin, make sure you have the following installed on your system:

- [Git](https://git-scm.com/)
- [Python](https://www.python.org/)
- [MariaDB](https://mariadb.org/)

## Installation

1. Clone the repository to your local machine:

   ```bash
   git clone https://github.com/datakind/affordable-housing-tooling.git
   ```

2. Change to the project directory:

   ```bash
   cd affordable-housing-tooling
   ```

3. Create a virtual environment using Python's venv module:

   ```bash
   python -m venv venv
   ```

4. Activate the virtual environment:

   ```bash
   source venv/bin/activate
   ```

5. Navigate to the `workstream1` directory:

   ```bash
   cd workstream1
   ```

6. Install project dependencies from the `requirements.txt` file:

   ```bash
   pip install -r requirements.txt
   ```

## Running the Application

To run the Workstream 1 application, set up the sql server using the cmfportfolio.sql file and use the following command from the `workstream1` directory:

```bash
python app.py
```

The Workstream 1 application should now be accessible at `http://localhost:5000` in your web browser.
