/* -----------------------------------------
DATA ANALYSIS
-------------------------------------------*/
-- Which defect type occurs most frequently
Select
	defect_type,
    COUNT(*) AS defect_count
FROM defects
GROUP BY defect_type
ORDER BY defect_count DESC;

-- What is the total repair cost by defect type
SELECT
	defect_type,
	ROUND(SUM(repair_cost),2) AS total_repair_cost
FROM defects
GROUP BY defect_type
ORDER BY total_repair_cost DESC;

-- Where do defects occur most often
SELECT
	defect_location,
    COUNT(*) AS defect_count
FROM defects
GROUP BY defect_location
ORDER BY defect_count DESC;

-- How do defect trends change over time
SELECT
	YEAR(defect_date) AS year,
    MONTH(defect_date) AS month,
    COUNT(*) AS defect_count
FROM defects
GROUP BY
	YEAR(defect_date),
    MONTH(defect_date)
ORDER BY
	year,
    month;
    
-- Which inspection method detects the most critical defects
SELECT 
	inspection_method,
    severity,
    COUNT(*) AS defect_count
FROM defects
GROUP BY
	inspection_method,
    severity
ORDER BY inspection_method;

-- Show all defect severities by inspection method
SELECT
	inspection_method,
    SUM(CASE WHEN severity = 'Minor' THEN 1 ELSE 0 END) AS Minor,
    SUM(CASE WHEN severity = 'Moderate' THEN 1 ELSE 0 END) AS Moderate,
    SUM(CASE WHEN severity = 'Critical' THEN 1 ELSE 0 END) AS Critical,
    COUNT(*) AS Total
FROM defects
GROUP BY inspection_method
ORDER BY inspection_method;




