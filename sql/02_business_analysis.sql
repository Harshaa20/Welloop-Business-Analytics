/*
=========================================================
INTERVIEW QUESTION MAPPING
=========================================================

ATHLETES

Q1_Athlete  - Earning tokens by answering wellbeing questions
Q2_Athlete  - Do tokens motivate participation?
Q3_Athlete  - Comfort using pre-owned equipment
Q4_Athlete  - Equipment willing to receive
Q5_Athlete  - Equipment willing to give
Q6_Athlete  - Preferred exchange method
Q7_Athlete  - Token exchange vs direct giving
Q8_Athlete  - Trust within team vs other teams
Q9_Athlete  - Fairness if others never contribute
Q10_Athlete - Previous experience with used sports gear
Q11_Athlete - Knowledge of dropout due to equipment cost
Q12_Athlete - Could gear exchange reduce dropout?
Q13_Athlete - Would this system actually work?

COACHES

Q1_Coach  - Reasons for youth sports dropout
Q2_Coach  - Role of equipment cost
Q3_Coach  - Motivation and retention
Q4_Coach  - Frequently replaced equipment
Q5_Coach  - Families struggling with costs
Q6_Coach  - Informal equipment sharing
Q7_Coach  - Digital wellbeing tools
Q8_Coach  - Benefits vs pressure
Q9_Coach  - Rewards and incentives
Q10_Coach - Negative effects of rewards
Q11_Coach - Trust within teams
Q12_Coach - Trust across teams
Q13_Coach - Opinion on token-based exchange
Q14_Coach - Practical challenges
Q15_Coach - Potential to reduce dropout
Q16_Coach - Requirements for success

=========================================================
*/


-- Business Decision 1
-- Is equipment affordability a significant problem in youth sports?

SELECT
    participant_id,
    team_name,
    question_key,
    response_text
FROM overall_data
WHERE question_key IN ('Q1_Coach','Q2_Coach','Q5_Coach')
ORDER BY question_key, participant_id;

-- Business Insight:
-- Coaches identified multiple factors contributing to youth sports dropout,
-- including school commitments, changing interests and financial barriers.
--
-- While equipment cost was rarely described as the sole reason for leaving,
-- it consistently emerged as a contributing factor, particularly for
-- families experiencing financial pressure.
--
-- Coaches also described existing informal equipment sharing within teams,
-- suggesting that the proposed digital exchange would formalize an
-- already accepted community behaviour rather than introduce an entirely
-- new practice.


-- Business Decision 2
-- Would athletes adopt a circular equipment exchange?

SELECT
    participant_id,
    team_name,
    question_key,
    response_text
FROM overall_data
WHERE question_key IN
(
'Q3_Athlete',
'Q4_Athlete',
'Q5_Athlete',
'Q6_Athlete'
)
ORDER BY participant_id, question_key;

-- Business Insight:
-- Athlete responses indicate strong potential adoption of a digital
-- circular equipment exchange. Participants were generally willing to
-- both receive and contribute pre-owned equipment, particularly football
-- boots and sports apparel.
--
-- Successful adoption depends on maintaining equipment quality,
-- providing a convenient digital interface, and supporting in-person
-- exchanges during regular training activities.


-- Business Decision 3
-- What could prevent athletes and coaches from using the platform?

SELECT
    participant_id,
    team_name,
    question_key,
    response_text
FROM overall_data
WHERE question_key IN
(
'Q7_Athlete',
'Q8_Athlete',
'Q9_Athlete'
)
ORDER BY participant_id, question_key;

-- Business Insight:
-- Athlete responses indicate that the token-based exchange model is
-- widely accepted and is often viewed as a reward rather than a barrier
-- to participation.
--
-- Trust was generally high, although athletes expressed greater comfort
-- exchanging with teammates or familiar users.
--
-- The strongest concern related to fairness. Participants expected
-- members of the community to contribute whenever possible and believed
-- that long-term success depends on active participation from both
-- contributors and recipients.


| Business Decision | Executive Summary                                                                                                |
| ----------------- | ---------------------------------------------------------------------------------------------------------------- |
| Decision 1        | Equipment affordability is a genuine, but not exclusive, contributor to youth sports dropout.                    |
| Decision 2        | Athletes show strong willingness to adopt a digital equipment exchange when quality and convenience are ensured. |
| Decision 3        | Trust is generally high, but long-term success depends on fairness and visible community participation.          |

-- Business Decision 4
-- Could the proposed feature reduce youth sports dropout?


SELECT
    participant_id,
    team_name,
    question_key,
    response_text
FROM overall_data
WHERE question_key IN
(
'Q11_Athlete',
'Q12_Athlete',
'Q13_Athlete',
'Q15_Coach',
'Q16_Coach'
)
ORDER BY participant_id, question_key;


SELECT
    participant_id,
    team_name,
    response_text
FROM overall_data
WHERE question_key = 'Q16_Coach'
ORDER BY participant_id;

-- =========================================================
-- Overall Business Insight – Decision 4
--
-- Athletes and coaches consistently believed that the proposed
-- token-based equipment exchange has the potential to reduce
-- financial barriers to youth sports participation. While they
-- recognized that equipment affordability is only one factor
-- influencing dropout, both stakeholder groups viewed the concept
-- as a valuable community initiative that could improve access to
-- sports and encourage continued participation.
--
-- Successful implementation depends on active user engagement,
-- trust, clear platform rules and sufficient community adoption.
-- Coaches also highlighted that the greatest impact is likely to
-- occur in sports and communities where equipment costs represent
-- a significant financial burden.
-- =========================================================


-- Final Recommendation to Welloop (Decision 4)

-- Based on the interview findings, Welloop should proceed with developing the token-based equipment exchange as an extension of its digital wellbeing platform. 
-- Rather than presenting it as a complete solution to youth sports dropout, the feature should be positioned as a community-driven initiative that lowers financial barriers, encourages equipment reuse, and strengthens inclusion. 
-- To maximize adoption, Welloop should focus on building an active user community, establishing clear exchange guidelines, and initially targeting sports or communities where equipment costs are highest before expanding more broadly.

