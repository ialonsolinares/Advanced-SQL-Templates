
--INTRODUCTION TO ROW_NUMBER() AND RANK() FUNCTIONS

--ROW_NUMBER() function assigns a unique sequential integer to each row within the partition of a result set.
--the row number starts with 1 for the first row in each partition.
--if equal values are present in the partition, the row number will be different for each row.

--RANK() function assigns a unique integer value to each distinct row within the partition of a result set.
--the rank of a row starts with 1 for the first row in each partition.
--if equal values are present in the partition, the rank will be the same for each row.

WITH CRM_customer_database AS 
    (SELECT customer_id, 
            service_id, 
            service_name, service_type, service_date, service_status, service_duration, service_price, service_discount, service_total_price,
            ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY activation_date DESC) AS rn
    FROM customer_CRM
    WHERE activation_date <= '2023-12-31'
    AND service_status = 'active'
    ),

--GET THE LATEST SERVICE FOR EACH CUSTOMER
CRM_customer_database_with_rn AS 
    (SELECT * 
    FROM CRM_customer_database 
    WHERE rn = 1
    )

SELECT * FROM CRM_customer_database_with_rn 
ORDER BY customer_id, service_date DESC;

--common use case for ROW_NUMBER() and RANK() functions is to find the latest record for each group of records.

