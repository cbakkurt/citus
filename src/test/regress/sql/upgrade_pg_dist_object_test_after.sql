-- drop objects from previous test (uprade_basic_after.sql) for a clean test
-- drop upgrade_basic schema and switch back to public schema
SET search_path to public;
DROP SCHEMA upgrade_basic CASCADE;

-- as we updated citus to available version,
--   "isn" extension
--   "new_schema" schema
--   "public" schema
-- will now be marked as distributed
-- but,
--   "seg" extension
-- will not be marked as distributed

-- 3 items
SELECT count(*) from citus.pg_dist_object;

--1
SELECT count(*) from citus.pg_dist_object where objid=(select oid from pg_extension where extname='isn');
SELECT count(*) from citus.pg_dist_object where objid=(SELECT 'new_schema'::regnamespace::oid);
SELECT count(*) from citus.pg_dist_object where objid=(SELECT 'public'::regnamespace::oid);

-- 0
SELECT count(*) from citus.pg_dist_object where objid=(select oid from pg_extension where extname='seg');
