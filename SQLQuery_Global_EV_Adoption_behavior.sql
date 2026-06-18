CREATE database global_ev_adoption_behavior

SELECT * from [dbo].[cleaned_dataset_global_ev_adoption_behavior_2026]

SELECT AVG(daily_commute_km) from [dbo].[cleaned_dataset_global_ev_adoption_behavior_2026]

SELECT AVG(fuel_expense_per_month) AS fuel_expanse ,AVG(monthly_charging_cost) AS Charging_Expanse from [dbo].[cleaned_dataset_global_ev_adoption_behavior_2026]

SELECT COUNT(ev_adoption_likelihood), city_type AS Area FROM [dbo].[cleaned_dataset_global_ev_adoption_behavior_2026]
GROUP BY city_type


USE [global_ev_adoption_behavior]
GO

CREATE VIEW vw_ev_customer_segments AS
SELECT 
    age,
    annual_income,
    city_type,
    ev_adoption_likelihood,
    -- Age Segmentation
    CASE 
        WHEN age < 30 THEN 'Gen Z / Young Adult'
        WHEN age BETWEEN 30 AND 45 THEN 'Millennial'
        WHEN age BETWEEN 46 AND 60 THEN 'Gen X'
        ELSE 'Boomer / Senior'
    -- Income Bracketing
    END AS age_group,
    CASE 
        WHEN annual_income < 30000 THEN 'Low Income'
        WHEN annual_income BETWEEN 30000 AND 70000 THEN 'Middle Income'
        ELSE 'High Income'
    END AS income_bracket
FROM [dbo].[cleaned_dataset_global_ev_adoption_behavior_2026];