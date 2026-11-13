# Startup Profitability Analysis (PRDA-01)

**Project:** Startup Profitability Analysis\
**Focus:** Multiple Linear Regression and Power BI Dashboard\
**Dataset:** 50 startups across New York, California, and Florida

## 1. Project Overview

This project analyses how Research and Development (R&D),
Administration, and Marketing spending are associated with startup
profit. It combines SQL-based data inspection, Python exploratory
analysis and multiple linear regression, an additional Orange workflow,
and an interactive Power BI dashboard.

The objective is to understand spending patterns, estimate profit for
two supplied spending scenarios, compare results across states, and
communicate practical findings.

## 2. Problem Statement

The project brief asks us to: - Examine the relationship between R&D,
Administration, and Marketing expenditure and startup profit. - Build a
regression model and predict profit for two specified spending
combinations. - Visualise the dataset using Power BI and provide
business observations and recommendations.

## 3. Dataset

The supplied CSV contains **50 records and 5 columns**:

  -----------------------------------------------------------------------
  Column                  Description             Role
  ----------------------- ----------------------- -----------------------
  `RD_Spend`              Research and            Regression input
                          development expenditure 

  `Administration`        Administration          Regression input
                          expenditure             

  `Marketing_Spend`       Marketing expenditure   Regression input

  `State`                 Startup location: New   Dashboard grouping
                          York, California, or    
                          Florida                 

  `Profit`                Startup profit          Regression target
  -----------------------------------------------------------------------

The supplied CSV was checked and contains no missing values.

**Dataset source for this submission:** CSV file
(`startup_profit_dataset.csv`).

## 4. Tools and Technologies

-   **MySQL Workbench / SQL:** database and table inspection queries.
-   **Python / Jupyter Notebook:** data loading, exploration,
    visualisation, multiple linear regression, model evaluation, and
    profit prediction.
-   **Orange Data Mining:** supplementary visual workflow and regression
    output.
-   **Power BI:** interactive dashboard and state-wise comparisons.
-   **Libraries:** pandas, NumPy, Matplotlib, Seaborn, and scikit-learn.

## 5. Project Workflow

1.  Load and inspect the supplied CSV dataset.
2.  Check dimensions, columns, summary information, and missing values.
3.  Use `RD_Spend`, `Administration`, and `Marketing_Spend` as
    independent variables (`X`), and `Profit` as the target (`y`).
4.  Split the data into 80% training (40 records) and 20% testing (10
    records), using `random_state=42`.
5.  Train a scikit-learn `LinearRegression` model.
6.  Evaluate the model using R², MAE, and RMSE.
7.  Predict profit for the two spending combinations in the project
    brief.
8.  Use Orange as a supplementary visual regression workflow.
9.  Build a Power BI dashboard to explore profit and spending by state.

## 6. Python Regression Analysis

The Python notebook uses multiple linear regression.

### Model equation

``` text
Predicted Profit =
54,071.8757
+ (0.803779 × RD_Spend)
- (0.067929 × Administration)
+ (0.031242 × Marketing_Spend)
```

### Test-set performance

  Metric       Result
  -------- ----------
  R²           0.9001
  MAE        6,979.15
  RMSE       8,995.91

The test R² indicates that the model explains approximately 90% of the
variation in profit in the 10 held-out test records. This is a result on
a small test sample and should be validated with more data before
operational use.

### Coefficient interpretation

-   R&D has a positive coefficient in this fitted model.
-   Marketing has a positive coefficient in this fitted model.
-   Administration has a slightly negative coefficient in this fitted
    model.

These coefficients describe associations in this dataset; they do not
prove that changing a spending category will cause profit to change by
the coefficient amount.

## 7. Required Profit Predictions

The following estimates use the two input combinations supplied in the
project brief.

  --------------------------------------------------------------------------
  Case             R&D Spend   Administration      Marketing       Predicted
                                                       Spend          Profit
  ----------- -------------- ---------------- -------------- ---------------
  Startup 1        21,892.92        81,910.77     164,270.70   **71,236.89**

  Startup 2        23,940.93        96,489.63     137,001.10   **71,040.76**
  --------------------------------------------------------------------------

These are model estimates, not confirmed actual profits.

## 8. Orange Data Mining -- Supplementary Regression Output

The project folder also includes an Orange workflow (`.ows`) and its
exported HTML regression result.

The supplied Orange HTML output reports a Linear Regression run with
**15 instances** and the following scores:

  Metric       Orange output
  -------- -----------------
  R²                   0.911
  MAE              8,571.898
  RMSE            12,175.874
  MSE        148,251,910.012

**Important:** This Orange report describes a 15-instance run, whereas
the Python analysis above uses the full 50-record CSV with a 40/10
train-test split. These results come from different runs/data scopes and
should not be treated as directly comparable or combined into one model
score. The Orange files are included as supplementary analysis
artifacts.

## 9. Power BI Dashboard

The Power BI dashboard includes four KPI cards: - Total Profit - Average
Profit - Total R&D Spend - Total Marketing Spend

It also includes a State slicer and four visuals: - Total Profit by
State - R&D Spend vs Profit - Administration Spend by State - Marketing
Spend by State

### Dashboard screenshot

![Startup Profitability Analysis Power BI
Dashboard](04_PowerBI/Dashboard_Screenshot.png)

Open the `.pbix` file in Power BI Desktop to interact with the dashboard
and use the State slicer.

## 10. Key Findings

### Overall measures

  Measure                                   Value
  ------------------------------- ---------------
  Number of startups                           50
  Total profit                       5,600,631.96
  Average profit                       112,012.64
  Total R&D spending                 3,686,080.78
  Total Administration spending      6,067,231.98
  Total Marketing spending          10,551,254.89

### Total profit by state

  State          Total profit
  ------------ --------------
  New York       1,933,859.59
  Florida        1,900,384.39
  California     1,766,387.98

New York has the highest total profit among the three states in the
supplied dataset.

The project report also records positive correlations between R&D
spending and profit (r = 0.973), and between Marketing spending and
profit (r = 0.748). These are dataset-level associations, not evidence
of causation.

## 11. Recommendations

-   Monitor R&D investment and evaluate projects using milestones and
    return-on-investment measures.
-   Track marketing campaigns by channel and compare incremental revenue
    and profit.
-   Review administrative costs for efficiency while maintaining
    essential operations and compliance.
-   Consider additional business context, such as industry, startup age,
    headcount, and market conditions, before reallocating budgets.
-   Collect more observations and validate the regression model on a
    larger independent dataset before using it for financial decisions.
-   Use the Power BI State slicer to explore differences in spending and
    profit by location.

## 12. Limitations

-   The dataset contains only 50 startups.
-   The Python test set contains 10 records.
-   The regression uses three spending variables and does not include
    State as a model feature.
-   Regression coefficients show associations and should not be
    interpreted as causal effects.
-   The Orange HTML report represents a separate 15-instance run and is
    not directly comparable to the Python full-dataset workflow.

## 13. Repository Structure

``` text
Startup_Profitability_Analysis/
│
├── 01_Dataset/
│   └── startup_profit_dataset.csv
│
├── 02_SQL/
│   └── profit_analysis_sql.sql
│
├── 03_Python/
│   └── PRDA_01_Profit_Analysis.ipynb
│
├── 04_PowerBI/
│   ├── startup_profitability_analysis_Dashboard.pbix
│   └── Dashboard_Screenshot.png
│
├── 05_Project_Report/
│   └── Project_Report.pdf
│
├── 06_Presentation/
│   └── Startup_Profitability_Analysis_PPT.pptx
│
├── 07_Orange/
│   ├── profit_analysis_orange_tool.ows
│   └── regression_result.html
│
└── README.md
```

## 14. How to Run

1.  Download or clone this project repository.
2.  Open the CSV in the `01_Dataset` folder.
3.  Open the SQL script in MySQL Workbench if you want to review the
    database inspection queries.
4.  Open the Jupyter Notebook in `03_Python` and run the cells in order.
    If needed, update the CSV path in the notebook to match the actual
    dataset filename and location.
5.  Open the Orange `.ows` workflow in Orange Data Mining to inspect the
    supplementary workflow.
6.  Open the `.pbix` file in Power BI Desktop to explore the dashboard.

Install the Python libraries if they are not already available:

``` bash
pip install pandas numpy matplotlib seaborn scikit-learn
```

## 15. Conclusion

The project combines SQL inspection, Python-based exploratory analysis
and multiple linear regression, supplementary Orange regression output,
and Power BI visualisation to study startup spending and profitability.
The Python model achieved a test R² of 0.9001 and estimated profits of
71,236.89 and 71,040.76 for the two required cases. The dashboard
provides state-wise comparisons of profit and spending. The findings are
exploratory and should be validated with a larger dataset before being
used for financial decisions.
