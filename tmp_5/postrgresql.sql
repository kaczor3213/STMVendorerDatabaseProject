-- Database: STMVendorerDatabaseProject

-- DROP DATABASE "STMVendorerDatabaseProject";

CREATE DATABASE "STMVendorerDatabaseProject"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Polish_Poland.1250'
    LC_CTYPE = 'Polish_Poland.1250'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

COMMENT ON DATABASE "STMVendorerDatabaseProject"
    IS 'Nasza baza danych na projekt z przedmiotu inżynieria baz danych';