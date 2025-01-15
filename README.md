# Customer Churn Prediction and Analysis

## Introduction
This project focuses on predicting and analyzing customer churn using a combination of **SQL** for data preparation, **Python** for machine learning and analysis, and **Power BI** for interactive visualizations. By integrating and analyzing customer demographic, usage, financial, and subscription data, the project identifies churn patterns and builds a predictive model to inform retention strategies.

---

## Project Components

### 1. SQL Files
#### **Data Normalization and Integration**
- Organized raw customer data into normalized tables: **Customers**, **UsageData**, **Financials**, **Subscriptions**, and **ChurnData**.
- Created a consolidated view, **CustomerSummary**, to facilitate analysis.

#### **Exploratory Data Analysis**
- Analyzed churn trends with SQL queries, including churn rates by **subscription type**, **gender**, and **tenure**.
- Aggregated spending and support data for churned vs. non-churned customers.
- Saved results in the **CustomerSummary** view for further analysis.

---

### 2. Python Files
#### **Data Integration and Cleaning**
- Connected to the SQL database using **SQLAlchemy** and **Pandas**.
- Imported data from the **CustomerSummary** view into Python.
- Cleaned, transformed, and saved the cleaned data back into MySQL.

#### **Customer Churn Prediction**
- Built a **Logistic Regression model** using key features like:
  - Age, TotalSpend, UsageFrequency, SupportCalls, and Tenure.
- Conducted feature engineering:
  - Created spending segments and high-support usage flags.
- Exported model predictions and visualized churn distributions by various categories.

---

## Key Steps

### **1. Data Integration**
- Imported and preprocessed data from SQL tables into Python.
- Addressed missing values and encoded categorical features.

### **2. Exploratory Data Analysis**
- **SQL**: Explored churn trends by **age**, **gender**, **tenure**, and **subscription type**.
- **Python**: Visualized churn distributions and correlations between features.

### **3. Model Building**
- Developed a **Logistic Regression model** with an accuracy of **82.30%**.
- Key features: Age, TotalSpend, UsageFrequency, SupportCalls, Tenure.

---

## Deliverables

### **SQL Files**
1. **Data Normalization and Integration**: Scripts for data preparation and table creation.
2. **Exploratory Data Analysis**: Queries for churn trends and feature aggregation.

### **Python Scripts**
1. **Data Integration and Cleaning**: SQL-to-Python data pipeline for preprocessing.
2. **Customer Churn Prediction**: Machine learning model and data visualizations.

### **Power BI Dashboard**
- Interactive visualizations of churn trends and model predictions.
- A link to the dashboard will be added upon completion.

### **Outputs**
- CSV files for:
  - Churn predictions.
  - Exploratory data analysis results.

---

## Findings and Insights

### **SQL Analysis**
- Churn rates were higher for:
  - Customers with **Basic subscriptions**.
  - Customers with **shorter tenures**.
- Spending above **600** significantly reduced churn likelihood.

### **Python Analysis**
- Visualizations revealed:
  - **Age groups in their 30s and 40s** exhibited higher churn rates.
  - Frequent **support calls** strongly correlated with churn.
- Feature importance from the Logistic Regression model aligned with SQL findings.

---

## Next Steps
1. **Explore Advanced Models**: Experiment with additional machine learning techniques (e.g., Random Forest, XGBoost) for better churn prediction accuracy.
2. **Model Deployment**: Deploy the predictive model for real-time churn monitoring.
3. **Enhance Retention Strategies**: Use findings to create targeted strategies for customers at higher churn risk, such as improving satisfaction among Basic subscribers and addressing frequent support callers.

---

## Conclusion
This project integrates **SQL**, **Python**, and **Power BI** to identify churn patterns and build a predictive model. These insights enable businesses to proactively retain customers, reduce churn, and drive profitability. The deliverables, including data pipelines, machine learning scripts, and visual dashboards, provide actionable tools for churn management.

