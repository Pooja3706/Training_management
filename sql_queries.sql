-- =====================================================================
-- Frappe Database Client Queries: Employee Training DocType
-- Database Name : _e59127e5a856fe84 (or select current Frappe DB)
-- Table Name    : tabEmployee Training
-- =====================================================================

-- ---------------------------------------------------------------------
-- Query 1: Department-Wise Training Metrics and Completion Overview
-- Computes total trainings, completed count, certified count, and average hours.
-- ---------------------------------------------------------------------
SELECT 
    department,
    COUNT(*) AS total_trainings,
    SUM(CASE WHEN status = 'Completed' THEN 1 ELSE 0 END) AS completed_count,
    SUM(CASE WHEN is_certified = 1 THEN 1 ELSE 0 END) AS certified_count,
    ROUND(AVG(duration_hours), 2) AS avg_duration_hours
FROM `tabEmployee Training`
GROUP BY department
ORDER BY total_trainings DESC;


-- ---------------------------------------------------------------------
-- Query 2: Training Hours by Training Type and Certification Success Rate
-- Calculates total training hours invested per type and certification rate.
-- ---------------------------------------------------------------------
SELECT 
    training_type,
    COUNT(*) AS total_sessions,
    ROUND(SUM(duration_hours), 1) AS total_hours,
    CONCAT(ROUND((SUM(CASE WHEN is_certified = 1 THEN 1 ELSE 0 END) / COUNT(*)) * 100, 1), '%') AS certification_rate
FROM `tabEmployee Training`
GROUP BY training_type
ORDER BY total_hours DESC;


-- ---------------------------------------------------------------------
-- Query 3: Completed and Certified Employee Trainings with Feedback
-- Lists certified employees, course titles, duration, and feedback notes.
-- ---------------------------------------------------------------------
SELECT 
    name AS doc_id,
    employee_id,
    employee_name,
    department,
    training_name,
    training_date,
    ROUND(duration_hours, 1) AS duration_hours,
    status,
    feedback
FROM `tabEmployee Training`
WHERE is_certified = 1 AND status = 'Completed'
ORDER BY training_date ASC;
