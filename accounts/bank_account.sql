--liquibase formatted sql
--see http://www.liquibase.org/

--changeset sixarm@sixarm.com:1
--preconditions onFail:HALT onError:HALT
--precondition-sql-check expectedResult:0 SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'bank_account'

create table bank_account (
  id uuid not null primary key,  

  -- User and financial intitution, such as a bank.
  user_id uuid references user, --example: user "Alice"
  organization_id uuid references org, --example: org "Acme Company"

  -- An bank routing number, a.k.a. transfer number, is used by financial
  -- institutions to identify each other, such as for doing wire transfers.
  routing_number varchar,

  -- A bank account number, a.k.a. depost number, is used by financial 
  -- institutions to identify a specific account within the institution.
  -- specific financial institutions within the United States.
  account_number varchar,

  -- ISO 9362 defines a standard format of Bank Identifier Codes.
  -- These are a.k.a. SWIFT, SWIFT-BIC, BIC, SWIFT ID, or SWIFT code.
  -- When an ISO 9362 code is assigned to a non-financial institution, 
  -- the code is a.k.a. Business Entity Identifier or BEI.
  iso_9362_code varchar(11)

);

--rollback drop table bank_account;