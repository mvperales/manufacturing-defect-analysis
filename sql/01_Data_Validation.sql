/* -----------------------------------------
DATA IMPORT VALIDATION
-------------------------------------------*/
-- Verify records imported
SELECT
	COUNT(*) AS total_rows,
    COUNT(DISTINCT defect_id) AS unique_defects,
    COUNT(DISTINCT product_id) AS products,
    MIN(defect_date) AS first_date,
    MAX(defect_date) AS last_date,
    ROUND(SUM(repair_cost),2) AS total_repair_cost,
    ROUND(AVG(repair_cost),2) AS avg_repair_cost
FROM defects;




