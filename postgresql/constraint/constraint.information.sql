/**
  * The catalog pg_constraint stores check, primary key, unique, foreign key, 
  * and exclusion constraints on tables. (Column constraints are not treated specially. 
  */

/* The scripts shows us contraint information which is given table */
SELECT
    con.*
FROM
    pg_catalog.pg_constraint con
    INNER JOIN pg_catalog.pg_class rel ON rel.oid = con.conrelid
    INNER JOIN pg_catalog.pg_namespace nsp ON nsp.oid = connamespace
WHERE
    rel.relname = '<TABLE_NAME>';