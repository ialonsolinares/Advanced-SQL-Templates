--WITH RECURSIVE: way to do loops in SQL, in this case we are going to use it to calculate the amount of money that a client has to pay in 24 months

WITH RECURSIVE cte AS (
    SELECT id, client_id, financed_amount, interest, 1 as month
    FROM financing_Database
    WHERE client_id = 1

    UNION ALL

    SELECT f.id, f.client_id, f.financed_amount, f.interest, cte.month + 1
    FROM financing_Database f
    JOIN cte ON f.client_id = cte.client_id
    WHERE cte.month < 24
)

--we loop through the table until we reach the 24th month, we calculate the amount of money that the client has to pay in that month and we sum it to the total amount of money that the client has to pay

