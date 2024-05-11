


-- Imagine we have this table named countries. We need to perform this join with many phone numbers and clients.
-- We need to prioritise the match in descending order to avoid a customer getting the wrong country. 
-- This is important when we have a country with a code that is a substring of another country code.

INSERT INTO Countries (country_code, country_name) VALUES
('1', 'USA'),
('44', 'United Kingdom'),
('91', 'India'),
('358', 'Finland'),
('49', 'Germany');

-- Perform a LEFT JOIN to match country codes with phone numbers, prioritizing longer matches first
SELECT 
    u.user_name,
    u.phone_number,
    COALESCE(c3.country_name, c2.country_name, c1.country_name, 'Unknown') AS country
FROM 
    Users u
    LEFT JOIN Countries c3 ON u.phone_number LIKE CONCAT(c3.country_code, '%') AND LENGTH(c3.country_code) = 3
    LEFT JOIN Countries c2 ON u.phone_number LIKE CONCAT(c2.country_code, '%') AND LENGTH(c2.country_code) = 2
    LEFT JOIN Countries c1 ON u.phone_number LIKE CONCAT(c1.country_code, '%') AND LENGTH(c1.country_code) = 1;