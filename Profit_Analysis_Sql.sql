-- Select the database
use project_profit_analysis;

-- Check available tables
SHOW TABLES;

-- Display the complete dataset
SELECT * FROM startup;

-- Count total startups
SELECT COUNT(*) FROM startup;

-- Check table structure
DESCRIBE startup;

-- Retrieve regression-related columns
SELECT
    RD_Spend,
    Administration,
    Marketing_Spend,
    Profit
FROM startup;

-- Check the state information
SELECT DISTINCT State
FROM startup;