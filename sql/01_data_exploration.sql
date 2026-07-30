CREATE DATABASE welloop_business_analytics;
USE welloop_business_analytics;

SELECT VERSION();

SHOW DATABASES;

SELECT *
FROM welloop_business_analytics.overall_data;

CREATE TABLE overall_data (
    participant_id VARCHAR(50),
    session_id VARCHAR(50),
    participant_type VARCHAR(30),
    team_name VARCHAR(100),
    team_code VARCHAR(20),
    sport VARCHAR(50),
    birth_year VARCHAR(10),
    age_2026 VARCHAR(10),
    gender VARCHAR(20),
    location VARCHAR(100),
    coach_interviewed VARCHAR(10),
    question_key VARCHAR(50),
    response_text TEXT
);

-----------------------------------------------------------------------------------------------------------------------

/*
=========================================================
Project : Welloop Business Analytics
File    : 01_data_exploration.sql

Purpose:
Explore and understand the interview dataset before
performing business analysis.

Author: Harsha Vardhan Gobanna
=========================================================
*/

-- Business Question 1
-- How many interview records are in the dataset?

SELECT COUNT(*) AS total_rows
FROM overall_data;

-- Result:
-- 1056 interview records


-- Business Question 2
-- How many unique participants?

SELECT COUNT(DISTINCT participant_id) AS unique_participants
FROM overall_data
WHERE participant_id <> '';

-- Result:
-- 48 unique participants
-- Note: One blank participant_id was excluded.


-- Business Question 3
-- Participants by sport

SELECT
    sport,
    COUNT(DISTINCT participant_id) AS participants
FROM overall_data
WHERE participant_id <> ''
GROUP BY sport
ORDER BY participants DESC;

-- Result:
-- Football : 38
-- Basketball : 10

-- Business Question 4
-- How many participants are there in each team?

SELECT
    team_name,
    COUNT(DISTINCT participant_id) AS participants
FROM overall_data
WHERE participant_id <> ''
GROUP BY team_name
ORDER BY participants DESC;

-- Result:
-- Uppsala IF U15             : 10
-- IF VP                      : 8
-- Uppsala Sirius U15         : 8
-- Rasbo IP U16              : 7
-- Uppsala Basketball P10     : 6
-- Uppsala Basketball Lions   : 4
-- Uppsala IF U16             : 4
-- Uppsala IF U18             : 1

-- Business Insight:
-- The dataset includes 8 teams.
-- Team sizes range from 1 to 10 participants.
-- The largest team is Uppsala IF U15 (10 participants).
-- No single team dominates the dataset, indicating reasonable representation across teams.


SELECT
    location,
    COUNT(DISTINCT participant_id) AS participants
FROM overall_data
WHERE participant_id <> ''
GROUP BY location
ORDER BY participants DESC;

-- Result:
-- Uppsala, Sweden : 48 participants

-- Business Insight:
-- All participants are from Uppsala, Sweden.
-- This indicates the study is geographically focused on a single region.
-- Therefore, findings reflect the perspectives of youth sports communities in Uppsala and should not be generalized to all of Sweden without further data.


SELECT
    participant_type,
    COUNT(DISTINCT participant_id) AS participants
FROM overall_data
WHERE participant_id <> ''
GROUP BY participant_type
ORDER BY participants DESC;

-- Result:
-- Athletes : 39
-- Coaches  : 9

-- Business Insight:
-- The dataset consists of 48 participants:
-- • 39 athletes (81.3%)
-- • 9 coaches (18.7%)
-- Since athletes make up the majority of participants, the overall findings are expected to primarily reflect athletes' perspectives, while coaches provide a smaller but valuable comparative viewpoint.

SELECT
    gender,
    COUNT(DISTINCT participant_id) AS participants
FROM overall_data
WHERE participant_id <> ''
GROUP BY gender
ORDER BY participants DESC;

-- Result:
-- Male         : 39
-- Not specified: 9

-- Business Insight:
-- All athlete participants are recorded as male.
-- Gender information is not available for the 9 coaches.
-- Therefore, gender-based analysis can only be performed for athletes, and any overall gender conclusions would be incomplete.

SELECT
    participant_type,
    gender,
    COUNT(DISTINCT participant_id) AS participants
FROM overall_data
WHERE participant_id <> ''
GROUP BY participant_type, gender
ORDER BY participant_type, gender;

-- Result:
-- Athlete | Male | 39
-- Coach   | -    | 9

-- Business Insight:
-- All athlete participants are male.
-- Coach records contain '-' for gender, indicating that gender was not collected or not recorded.
-- As a result, gender-based analysis is only possible for athlete participants.


SELECT
    age_2026,
    COUNT(DISTINCT participant_id) AS participants
FROM overall_data
WHERE participant_id <> ''
GROUP BY age_2026
ORDER BY age_2026;

-- Result:
-- 13    : 3
-- 13-14 : 7
-- 15    : 20
-- 16    : 9
-- -     : 9

-- Business Insight:
-- Participant ages are primarily between 13 and 16 years old, confirming
-- that the study focuses on youth athletes.
--
-- However, the age column contains inconsistent values:
-- • Individual ages (13, 15, 16)
-- • An age range (13-14)
-- • Missing values represented by '-'
--
-- The 9 missing age values correspond to coach participants, indicating that
-- age was not recorded for coaches.

-- Data Quality Assessment

-- Observation 1:
-- One record contains a blank participant_id.
-- This record is excluded from participant-level analyses.

-- Observation 2:
-- Gender is recorded as '-' for all coach participants.

-- Observation 3:
-- Age is stored using mixed formats:
-- • 13
-- • 15
-- • 16
-- • 13-14
-- • -

-- Observation 4:
-- No unexpected sports or locations were identified.
-- All participants belong to Football or Basketball teams in Uppsala, Sweden.

-- Overall Assessment:
-- The dataset is suitable for analysis.
-- Minor cleaning is required when performing participant-level demographic analyses.