# Walmart Data Analysis: End-to-End SQL & Python Project

## Project Overview
This project provides a comprehensive analysis of Walmart sales data, leveraging **Python** for rigorous data cleaning and **MySQL** for deep-dive business intelligence. The goal is to identify trends, optimize shifts, and analyze profitability across different branches and product categories.

## Project Workflow

### 1. Data Cleaning & Exploration (Python/Jupyter)
Before moving the data into a database, I used **Pandas** to ensure data integrity and prepare features for SQL analysis:
* **Missing Values**: Identified and dropped null entries in `unit_price` and `quantity`.
* **Duplicate Removal**: Removed 51 duplicate records to prevent skewed metrics.
* **Currency Formatting**: Stripped `$` symbols from `unit_price` and converted it to a float for calculation.
* **Feature Engineering**: 
    * Created a `total` column (`unit_price * quantity`).
    * Extracted `day_name` from dates to enable weekday-specific analysis.
    * Categorized transactions into `Morning`, `Afternoon`, and `Evening` shifts.

### 2. Data Visualization (Matplotlib/Seaborn)
Exploratory Data Analysis (EDA) was performed to visualize key patterns:
* **Profit by Category**: Ranked the most lucrative product segments.
* **Payment Preferences**: Visualized the distribution of E-wallets, Cash, and Credit Cards.
* **Correlation Heatmap**: Analyzed the relationship between price, quantity, and margins.

### 3. Database Pipeline (SQLAlchemy)
Instead of manual imports, I developed a Python-to-MySQL pipeline:
* Established a connection using `sqlalchemy` and `pymysql`.
* Automated table creation and data insertion using the `.to_sql()` method in Pandas.

### 4. Advanced SQL Analysis
With the cleaned data in MySQL, I solved **9 specific business problems**:
1.  **Payment Method Analysis**: Aggregated transactions and items sold by payment type.
2.  **Top-Rated Categories**: Found the highest-rated category per branch.
3.  **Busiest Day**: Identified the day with the highest transaction volume for every branch.
4.  **Sales Volume**: Totaled quantities sold per payment method.
5.  **City Metrics**: Analyzed min, max, and average ratings by city and category.
6.  **Profitability**: Ranked categories by absolute profit.
7.  **Preferred Payments**: Determined the most common payment method used at each branch.
8.  **Shift Analysis**: Counted transactions occurring in Morning, Afternoon, and Evening shifts.
    * *Morning*: < 12:00 | *Afternoon*: 12:00 - 18:00 | *Evening*: > 18:00.
9.  **Revenue Decline**: Identified branches with negative Year-Over-Year (YoY) growth.

---

## Technical Stack
* **Language**: Python 3.x
* **Libraries**: Pandas, NumPy, Matplotlib, Seaborn, SQLAlchemy, PyMySQL
* **Database**: MySQL 8.0
* **Tools**: Jupyter Notebook, VS Code, MySQL Workbench

## Requirements
To run this project locally, install the necessary libraries:
```bash
pip install pandas numpy matplotlib seaborn sqlalchemy pymysql
