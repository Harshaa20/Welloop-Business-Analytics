-- =========================================================
-- Project: Welloop Business Analytics
-- File: 03_dashboard_queries.sql
--
-- Objective:
-- SQL queries used to prepare datasets for the Power BI
-- dashboard and executive business reporting.
--
-- Each query answers a business question and produces a
-- dataset for visualization.
-- =========================================================


-- =========================================================
-- Dashboard Dataset 1
-- Executive Overview
-- Total Participants
-- =========================================================

SELECT
    COUNT(DISTINCT participant_id) AS total_participants
FROM overall_data;

-- Dashboard 1 - Total Participants

SELECT COUNT(DISTINCT participant_id) AS Total_Participants
FROM overall_data;

-- Dashboard 2 - Participants by Role

SELECT
    participant_type,
    COUNT(DISTINCT participant_id) AS Participants
FROM overall_data
GROUP BY participant_type;

-- Dashboard 3 - Participants by Sport

SELECT
    sport,
    COUNT(DISTINCT participant_id) AS Participants
FROM overall_data
WHERE sport IS NOT NULL
AND sport <> ''
GROUP BY sport
ORDER BY Participants DESC;

-- Dashboard 4 - Participants by Team

SELECT
    team_name,
    COUNT(DISTINCT participant_id) AS Participants
FROM overall_data
GROUP BY team_name
ORDER BY Participants DESC;

-- Dashboard 5 - Responses by Question

SELECT
    question_key,
    COUNT(*) AS Responses
FROM overall_data
GROUP BY question_key
ORDER BY question_key;


