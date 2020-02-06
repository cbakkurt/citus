-- create some objects that we just included into distributed object
-- infrastructure in 9.1 versions but not included in 9.0.2

-- extension propagation --

-- create an extension on all nodes and a table that depends on it
CREATE EXTENSION isn;
SELECT run_command_on_workers($$CREATE EXTENSION isn;$$);

CREATE TABLE isn_dist_table (key int, value issn);
SELECT create_reference_table('isn_dist_table');

-- create an extension on all nodes, but do not create a table depending on it
CREATE EXTENSION seg;
SELECT run_command_on_workers($$CREATE EXTENSION seg;$$);

-- schema propagation --

-- public schema
CREATE TABLE dist_table (a int);
SELECT create_reference_table('dist_table');

-- custom schema
CREATE SCHEMA new_schema;

SET search_path to new_schema;

CREATE TABLE another_dist_table (a int);
SELECT create_reference_table('another_dist_table');
