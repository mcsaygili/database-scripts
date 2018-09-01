/* so, how can we rebuild invalid indexes ?
1. Use the REINDEX. REINDEX will lock the table for writes while the index is being created. So it's not suggested.
2. Drop the index and try to re-build (suggested).
*/

/* detect invalid index list */
SELECT *
FROM pg_class,
     pg_index
WHERE pg_index.indisvalid = false
  AND pg_index.indexrelid = pg_class.oid;

/* detect invalid index list - another way */
SELECT *
FROM pg_catalog.pg_class c,
     pg_catalog.pg_namespace n,
     pg_catalog.pg_index i
WHERE (i.indisvalid = false OR i.indisready = false)
  AND i.indexrelid = c.oid
  AND c.relnamespace = n.oid
  AND n.nspname != 'pg_catalog'
  AND n.nspname != 'information_schema'
  AND n.nspname != 'pg_toast';