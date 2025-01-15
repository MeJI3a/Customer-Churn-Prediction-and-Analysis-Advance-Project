# Project 6:Customer Churn Prediction and Analysis

## Introduction
This project focuses on customer churn prediction and analysis using a combination of SQL and Python, and a Power BI dashboard for interactive visualizations. By integrating and analyzing customer demographic, usage, financial, and subscription data, the project identifies churn patterns and builds a predictive model to inform retention strategies.

---

## Project Components

### 1. **SQL Files**
- **`Data Normalization and Integration.sql`**:
  - Structured the raw customer data into normalized tables (`Customers`, `UsageData`, `Financials`, `Subscriptions`, `ChurnData`) using SQL scripts.
  - Created a consolidated view, `CustomerSummary`, to facilitate analysis.
- **`Exploratory Data Analysis.sql`**:
  - Analyzed churn trends using SQL queries, including churn rates by subscription type, gender, and tenure.
  - Aggregated spending and support data for churned vs. non-churned customers.
  - Results saved in the `CustomerSummary` view for further analysis.

### 2. **Python Files**
- **`Data Integration and Cleaning`**:
  - Connected to the SQL database using SQLAlchemy and Pandas.
  - Imported data from the `CustomerSummary` view into Python.
  - Cleaned, transformed, and saved the cleaned data back to MySQL.
- **`Customer Churn Prediction.py`**:
  - Built a Logistic Regression model using features like age, spending, and support calls.
  - Conducted feature engineering (spending segments, high support flags).
  - Exported model predictions and analyzed churn by various categories using Python visualizations.
---

## Key Steps

### Data Integration
- Data from SQL tables was imported into Python for preprocessing and feature engineering.
- Missing values were handled, and categorical features were encoded.

### Exploratory Data Analysis
- SQL:
  - Churn trends by age, gender, tenure, and subscription type were explored.
- Python:
  - Visualized churn distributions and correlations between features.

### Model Building
- A Logistic Regression model was trained on features such as:
  - `Age`, `TotalSpend`, `UsageFrequency`, `SupportCalls`, `Tenure`.
- The model achieved an **accuracy of 82.30%**.

---

## Deliverables
1. **SQL Files**:
   - **Data Normalization and Integration**: Data preparation and table creation scripts.
   - **Exploratory Data Analysis**: Churn trends and feature aggregation queries.
2. **Python Scripts**:
   - **Data Integration and Cleaning**: SQL-to-Python data pipeline for preprocessing.
   - **Customer Churn Prediction**: Machine learning model and visualizations.
3. **Power BI Dashboard**:
   - A link will be added upon completion.
4. **Outputs**:
   - CSV files for churn predictions and EDA exports.

---

## Findings and Insights

### SQL Analysis
- Churn rates were higher for:
  - Customers with Basic subscriptions.
  - Customers with shorter tenures.
- Spending above 600 significantly reduced churn likelihood.

### Python Analysis
- Visualizations showed:
  - Age groups in their 30s and 40s exhibited higher churn rates.
  - Frequent support calls correlated strongly with churn.
- Feature importance from the Logistic Regression model aligned with SQL findings.

---

## Next Steps
- Explore additional modeling techniques for better churn prediction.
- Deploy the model to monitor churn predictions in real time.
