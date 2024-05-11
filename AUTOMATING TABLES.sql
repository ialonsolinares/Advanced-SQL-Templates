-- Imagine youn have a long query that you want to run overnight in order to replace a table with a new one.
-- You can create a temporary table, run the query and then replace the original table with the temporary one.


DROP TABLE IF EXISTS production_analysis CASCADE;


CREATE TABLE update_analysis (
    "id" SERIAL,
    "product_name" TEXT NOT NULL,
    "price" TEXT NOT NULL,
    "metric1" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "metric2" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "metric3" TIMESTAMP,
    PRIMARY KEY ("id")
);

CREATE TABLE production_analysis AS SELECT * FROM update_analysis;
DROP TABLE update_analysis;


--you can also create a temporary table directly:

CREATE TEMP TABLE update_analysis (
    "id" SERIAL,
    "product_name" TEXT NOT NULL,
    "price" TEXT NOT NULL,
    "metric1" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "metric2" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "metric3" TIMESTAMP,
    PRIMARY KEY ("id")
);

--Lastly, we select it to view it and take a look at the registeries. 
--if the table is empty, it means that the query was not executed correctly. 
--usually, if the table has more registeries than the original one, it means that the query was executed correctly

SELECT * FROM production_analysis;