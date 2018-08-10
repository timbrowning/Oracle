--assignment 
-- CUSTOMER ACCOUNT

--drop tables

DROP TABLE PHONECUSTOMER;
DROP TABLE CUS_PHONES;
DROP TABLE STORES;
DROP TABLE Phone_Usage;
DROP TABLE Billing_Table;


CREATE TABLE MYPHONE_CUSTOMER
(
CUSTOMER_ID VARCHAR(10) PRIMARY KEY,
CNAME VARCHAR (20) NOT NULL,
CADDRESS VARCHAR (50),
E_MAIL VARCHAR (50)
);


--STORES WHO OWNS WHAT CODE
CREATE TABLE CUS_PHONES
(
CUSTOMER_ID VARCHAR(10) REFERENCES PHONECUSTOMER(CUSTOMER_ID),
PHONE_NUM NUMBER(10),
SERIAL_NUMBER NUMBER(10) references SERIAL_NO
);


CREATE TABLE Phone_Usage
(
    Text_Type VARCHAR (20),
    Call_Type VARCHAR (20),
    Call_Duration FLOAT (10), /*Call is charge in time units */
    Purchase_Application NUMBER (10),
    Service_Provider VARCHAR(20),
    Cost_Per_Unit NUMBER(4,2),
    Size_Of_Unit VARCHAR(3)
);

CREATE TABLE Billing_Table
(       
        NDate VARCHAR(10),
        Phone_Number NUMBER (10),
        Phone_Provider VARCHAR (20),
        Call_Type VARCHAR(20), --REFERENCES Phone_Usage(Call_Type)
        Cost_Per_Unit NUMBER(4,2), --REFERENCES Phone_Usage(Cost_Per_Unit)
        Num_Of_Units NUMBER(10),
        Total_Cost_Of_Usage Number(10),
        Rental_Charge Number(10)
    
);

CREATE TABLE STORES
(
STORE_ID NUMBER(10) PRIMARY KEY,
STORE_NUM NUMBER(10),
STORE_ADDRESS VARCHAR(40)
);

INSERT INTO PHONECUSTOMER VALUES ('JF72919','Kayleigh Coffey','4 Pivot Drive, County Dublin','kayleigh.coffey@mydit.ie',2,2);
INSERT INTO PHONECUSTOMER VALUES ('UH29384','Tim Browning','53 The Green, Dublin 2','timbrowning@gmail.com',1,1);
INSERT INTO PHONECUSTOMER VALUES ('CKDN913','Kingsley Chimezie','21 Square Park, Dublin 24','kingsley.chimezie@mydit.ie',4,2);
INSERT INTO PHONECUSTOMER VALUES ('QNS9213','John White','89 Pearse Lane Dublin 4','j.white@gmail.com',6,4);


SELECT * FROM PHONECUSTOMER;

INSERT INTO STORES VALUES (01274638,'21 Grafton Street');
INSERT INTO STORES VALUES (01638296,'45 OCONNELL STREET');
INSERT INTO STORES VALUES (01392734,'UNIT 5 DUNDRUM SHOPPING CENTRE');
 
SELECT * FROM STORES;






