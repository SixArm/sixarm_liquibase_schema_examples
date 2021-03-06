--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'tag'

-- Tag
-- https://en.wikipedia.org/wiki/Tag_(metadata)
-- A label attached to someone or something for the purpose of identification or to give other information.

create table tag (
  id uuid not null primary key,
  name_as_en varchar, -- example: hot
  name_as_es varchar, -- example: caliente
  name_as_fr varchar -- example: chaud
);

--rollback drop table tag;
