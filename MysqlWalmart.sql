-- SELECT * FROM Walmart;
-- SELECT COUNT(*) FROM Walmart;
-- SELECT DISTINCT payment_method FROM Walmart;
-- SELECT payment_method, COUNT(*) as count FROM Walmart GROUP BY payment_method;
-- SELECT DISTINCT Branch FROM Walmart;

-- BUSSINESS PROBLEMS
-- 1) Payment methods, transactions, and items sold
/* SELECT
    payment_method,
    COUNT(*) AS total_transactions,
    SUM(quantity) AS total_items_sold
FROM Walmart
GROUP BY payment_method
ORDER BY total_transactions DESC; */

-- 2)Identify the Highest-Rated Category in Each Branch
/* SELECT Branch, category, avg_rating
FROM (
    SELECT
        Branch,
        category,
        AVG(rating) AS avg_rating,
        ROW_NUMBER() OVER (
            PARTITION BY Branch
            ORDER BY AVG(rating) DESC
        ) AS rn
    FROM Walmart
    GROUP BY Branch, category
) AS ranked_category
WHERE rn = 1
ORDER BY Branch;*/

-- 3)Determine the Busiest Day for Each Branch
-- 1. Add the column to the table
-- ALTER TABLE Walmart ADD COLUMN day_name VARCHAR(20);

-- 2. Update the column by extracting the day name from your date text
-- UPDATE Walmart 
-- SET day_name = DATE_FORMAT(STR_TO_DATE(date, '%d/%m/%y'), '%W');
/*
SELECT 
    Branch, 
    day_name,
    COUNT(*) AS transaction_count
FROM Walmart t1
GROUP BY Branch, day_name
HAVING COUNT(*) = (
    -- Subquery to find the maximum count for the specific branch
    SELECT MAX(sub.cnt)
    FROM (
        SELECT Branch, day_name, COUNT(*) as cnt
        FROM Walmart
        GROUP BY Branch, day_name
    ) sub
    WHERE sub.Branch = t1.Branch
); */

-- 4) Calculate Total Quantity Sold by Payment Method
/*
SELECT 
    payment_method, 
    SUM(quantity) AS total_quantity_sold
FROM Walmart
GROUP BY payment_method
ORDER BY total_quantity_sold DESC;*/

-- 5) Analyze Category Ratings by City
/* SELECT 
    City, 
    category, 
    MIN(rating) AS min_rating, 
    MAX(rating) AS max_rating, 
    AVG(rating) AS avg_rating
FROM Walmart
GROUP BY City, category
ORDER BY City, avg_rating DESC;*/

-- 6. Calculate Total Profit by Category
/*SELECT 
    category, 
    SUM(total * profit_margin) AS total_profit
FROM Walmart
GROUP BY category
ORDER BY total_profit DESC;*/

-- 7) Determine the Most Common Payment Method per Branch
/* SELECT 
    Branch, 
    payment_method, 
    COUNT(*) AS total_transactions
FROM Walmart t1
GROUP BY Branch, payment_method
HAVING COUNT(*) = (
    -- This subquery identifies the highest transaction count for each specific branch
    SELECT MAX(sub.cnt)
    FROM (
        SELECT 
            Branch, 
            payment_method, 
            COUNT(*) AS cnt
        FROM Walmart
        GROUP BY Branch, payment_method
    ) sub
    WHERE sub.Branch = t1.Branch
);*/

-- 8) Analyze Sales Shifts Throughout the Day
/*SELECT 
    Branch,
    CASE 
        WHEN HOUR(STR_TO_DATE(time, '%H:%i:%s')) < 12 THEN 'Morning'
        WHEN HOUR(STR_TO_DATE(time, '%H:%i:%s')) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS transaction_count
FROM Walmart
GROUP BY Branch, shift
ORDER BY Branch, FIELD(shift, 'Morning', 'Afternoon', 'Evening'); */

-- 9) Identify Branches with Highest Revenue Decline Year-Over-Year
/* SELECT Branch, yr, revenue, prev_revenue, 
       (revenue - prev_revenue) as revenue_diff
FROM (
    SELECT 
        Branch, 
        YEAR(STR_TO_DATE(date, '%d/%m/%y')) as yr,
        SUM(total) as revenue,
        LAG(SUM(total)) OVER(PARTITION BY Branch ORDER BY YEAR(STR_TO_DATE(date, '%d/%m/%y'))) as prev_revenue
    FROM Walmart
    GROUP BY Branch, yr
) sub
WHERE revenue < prev_revenue; */

