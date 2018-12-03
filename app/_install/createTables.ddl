-- Generated by Oracle SQL Developer Data Modeler 4.1.5.907
--   at:        2018-11-14 19:23:17 EET
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




CREATE TABLE Customer
  (
    customer_id    NUMBER NOT NULL ,
    customer_fname VARCHAR2 (50) ,
    customer_lname VARCHAR2 (50) ,
    customer_phone NUMBER ,
    customer_email VARCHAR2 (20) NOT NULL
  ) ;
ALTER TABLE Customer ADD CONSTRAINT Customer_PK PRIMARY KEY ( customer_id ) ;
ALTER TABLE Customer ADD CONSTRAINT Customer_customer_email_UN UNIQUE ( customer_email ) ;


CREATE TABLE Department
  (
    dept_id   NUMBER NOT NULL ,
    dept_name VARCHAR2 (50)
  ) ;
ALTER TABLE Department ADD CONSTRAINT Department_PK PRIMARY KEY ( dept_id ) ;


CREATE TABLE Employee
  (
    emp_id       NUMBER NOT NULL ,
    emp_username VARCHAR2 (50) ,
    emp_fname    VARCHAR2 (50) ,
    emp_lname    VARCHAR2 (50) ,
    emp_phone    NUMBER ,
    emp_email    VARCHAR2 (30) NOT NULL ,
    emp_salary   NUMBER ,
    emp_hiredate DATE ,
    dept_id      NUMBER NOT NULL
  ) ;
ALTER TABLE Employee ADD CONSTRAINT Employee_PK PRIMARY KEY ( emp_id ) ;
ALTER TABLE Employee ADD CONSTRAINT emp_email_UN UNIQUE ( emp_email ) ;


CREATE TABLE Reservation
  (
    rsv_id        NUMBER NOT NULL ,
    checkin_date  DATE ,
    checkout_date DATE ,
    rsv_date      DATE ,
    rsv_price     NUMBER ,
    rsv_status    VARCHAR2 (20) ,
    customer_id   NUMBER NOT NULL ,
    emp_id        NUMBER NOT NULL ,
    room_number   NUMBER NOT NULL
  ) ;
CREATE UNIQUE INDEX Reservation__IDX ON Reservation
  (
    room_number ASC
  )
  ;
ALTER TABLE Reservation ADD CONSTRAINT Reservation_PK PRIMARY KEY ( rsv_id ) ;


CREATE TABLE Room
  (
    room_number NUMBER NOT NULL ,
    roomtype_id NUMBER NOT NULL
  ) ;
ALTER TABLE Room ADD CONSTRAINT Room_PK PRIMARY KEY ( room_number ) ;


CREATE TABLE Room_Type
  (
    type_id      NUMBER NOT NULL ,
    room_type    VARCHAR2 (20) ,
    room_price   NUMBER ,
    room_details VARCHAR2 (100)
  ) ;
ALTER TABLE Room_Type ADD CONSTRAINT Room_Type_PK PRIMARY KEY ( type_id ) ;


ALTER TABLE Employee ADD CONSTRAINT Employee_Department_FK FOREIGN KEY ( dept_id ) REFERENCES Department ( dept_id ) ;

ALTER TABLE Reservation ADD CONSTRAINT Reservation_Customer_FK FOREIGN KEY ( customer_id ) REFERENCES Customer ( customer_id ) ;

ALTER TABLE Reservation ADD CONSTRAINT Reservation_Employee_FK FOREIGN KEY ( emp_id ) REFERENCES Employee ( emp_id ) ;

ALTER TABLE Reservation ADD CONSTRAINT Reservation_Room_FK FOREIGN KEY ( room_number ) REFERENCES Room ( room_number ) ;

ALTER TABLE Room ADD CONSTRAINT Room_Room_Type_FK FOREIGN KEY ( roomtype_id ) REFERENCES Room_Type ( type_id ) ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             1
-- ALTER TABLE                             13
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
