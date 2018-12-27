--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'locality'

create table locality (
  id uuid not null primary key,
  name_as_en varchar, -- example: "San Francisco"
  name_as_es varchar, -- example: "San Francisco"
  name_as_fr varchar, -- example: "Saint François"
  postal_region_id uuid, -- example: California
  country_id uuid -- example: United States
);

--rollback drop table locality;
