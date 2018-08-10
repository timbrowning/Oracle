/*
  DT2112A5 - Case Study 1 - 'PHONE'     
  Kingsley Chimezie
  Tim Browning
  Kayleigh Coffey
  Phone Company (MyPhone) Structure
  
  Date: 03/03/16
*/

/* Layer 4 */
DROP TABLE Cust_Contract;
DROP TABLE Billing_Table;


/* layer 3 */
DROP TABLE Customer;

/* layer 2 */
DROP TABLE Phone_Specs;

/* Layer 1 */
DROP TABLE Phone_Numbers;
DROP TABLE Supplier;
DROP TABLE Staff;
DROP TABLE Stores;

/* Layer 1 Tables */
CREATE TABLE Phone_Numbers

(
  PHONE_NUMBER Number(12) primary key                                             --Database of all phone numbers  
); 

CREATE TABLE Supplier
(
  SUPPLIER_NAME       Varchar(20) Not Null primary key,                            --Manufacturers
  Supplier_Address    Varchar(20)
  
);

CREATE TABLE Staff
(
    Staff_No      Number(4) PRIMARY KEY Not Null,                                 -- Staff details
    Staff_Name    Varchar(20) Not Null   
);

CREATE TABLE Stores
(
  STORE_ID        NUMBER(4) PRIMARY KEY,                                          -- Store Details
  Srore_Address   VARCHAR(40),
  Store_Number    Number(12)
);


/* Layer 2 Tables */
CREATE TABLE Phone_Specs                                                        
(
  SERIAL_NO       NUMBER(15) PRIMARY KEY,                                       --Phone Specifications
  Phone_Brand     VARCHAR(50) NOT NULL references Supplier,
  Phone_Type      VARCHAR(50) NOT NULL,
  Camera          VARCHAR(20),
  Colour          VARCHAR(10),
  Battery_mAh     VARCHAR(7),
  Price           NUMBER(7,2)   
);

/* Layer 3 Tables */
CREATE TABLE Customer
(
    Phone_No      Number(12) Not Null references Phone_Numbers,                      -- Customer Details
    Cust_Name     Varchar(20) Not Null,
    Address       Varchar(80),
    Email         Varchar(25),
    Serial_Num    NUMBER(15) NOT NULL references Phone_Specs
    
);

/* Layer 4 Tables */
CREATE TABLE Billing_Table
(       
    BILLING_NO                      NUMBER(5) primary key,                  -- Billing Information
    Phone_Number                    NUMBER (12) references Phone_Numbers,
    Text_Msg_units                  Number(4) Not Null,
    International_call_units        NUMBER(4) Not Null,
    Cellular_Data_units             NUMBER(10) Not Null,
    Total_Units                     Number(10) Not Null
    
);


CREATE TABLE Cust_Contract
(
  CONTRACT_NO         NUMBER(7) Not Null primary key,-- Can be online or in shop             -- Setting up a customer contract
  Staff_No            Number (4) references Staff,
  Phone_Num           Number(12) NOT NULL References Phone_Numbers,
  Store_Id            NUMBER(10) NOT NULL REFERENCES Stores
);


/* INSERTS */


/*Layer 1*/
INSERT INTO Supplier values ('iPhone','Sanfrancisco');
INSERT INTO Supplier values ('Samsung','Beijing');
INSERT INTO Supplier values ('Sony','Texas');


INSERT INTO Phone_Numbers values (353874449283);
INSERT INTO Phone_Numbers values (353874441241);
INSERT INTO Phone_Numbers values (353874443563);
INSERT INTO Phone_Numbers values (353874443457);
INSERT INTO Phone_Numbers values (353874444591);


INSERT INTO Staff Values (6802,'Tim');
INSERT INTO Staff Values (6803,'Kayl');
INSERT INTO Staff Values (6804,'Kings');

INSERT INTO Stores Values(4321,'Rathfarnham',35383458679);
INSERT INTO Stores Values(4322,'Templeogue',353834586754);
INSERT INTO Stores Values(4323,'Blackrock',353834523423);


/* Layer 2 */

INSERT INTO Phone_Specs Values (823948765342564,'iPhone','iphone6','12mp','black','12W',800);
INSERT INTO Phone_Specs Values (987465234987567,'iPhone','iphone6splus','12mp','white','12W',1000);
INSERT INTO Phone_Specs Values (983746514256534,'Samsung','S7','12mp','12W','yellow',700);
INSERT INTO Phone_Specs Values (987478984756543,'Sony','Xperia','12mp','12W','green',600);


/* Layer 3 */
INSERT INTO Customer VALUES (353874449283,'John Flaherty','23 The Green, Blackhill, Dublin 25.','jflahherty@gmail.com',823948765342564);
INSERT INTO Customer VALUES (353874441241,'Tim Browning','56 Fake street, Dublin 25.','tbrowning@gmail.com',983746514256534);
INSERT INTO Customer VALUES (353874443563,'Kayleigh','77 Lockroad, Dublin','Kaily@gmail.com',987478984756543);
INSERT INTO Customer VALUES (353874449283,'Kingsley','93 Knocklyon, Dublin','Kings@gmail.com',987465234987567);


/* Layer 4 */
INSERT INTO Billing_Table values (12345,353874449283,20,54,2,76);
INSERT INTO Billing_Table values (12346,353874441241,30,17,2,49);
INSERT INTO Billing_Table values (12347,353874443563,10,6,9,25);


INSERT INTO Cust_Contract values(1234567,6802,353874449283,4321);
INSERT INTO Cust_Contract values(1234568,6803,353874441241,4322);
INSERT INTO Cust_Contract values(1234569,6804,353874449283,4323);

--SELECT * from customer;
--SELECT * from Phone_Specs;
--SELECT * from Cust_Order;
--SELECT * from Billing_Table;



-----------------------------------------

/*
    DATABASE -      Case study part 2 - 'MyPhone'
    GROUP:          DT2112-A5
    TASK:           By Kingsley Chimezie
    DESCRIPTION:    This task portion of our assignment handles all queries relating to the Phones.
    
    DATE:           03/04/16
    
*/


-- CLEAR ALL TABLES (DROPS) --
DROP TABLE Phones;
DROP TABLE Phone_Specs;
DROP TABLE Phone_Types;
DROP TABLE Phone_Brands;



------------------------------------------------------- T1:  PHONE BRANDS
CREATE TABLE Phone_Brands                           
(
  Brand_Name      VARCHAR2(50)    NOT NULL,   PRIMARY KEY(Brand_Name)
);


------------------------------------------------------- T2:  PHONE TYPES
CREATE TABLE Phone_Types                            
(
  Brand_Type      VARCHAR2(50)    NOT NULL,   PRIMARY KEY(Brand_Type),
  Brand_Name      VARCHAR2(50)    NOT NULL    REFERENCES Phone_Brands(Brand_Name)
);


------------------------------------------------------- T3:  PHONE TYPES FEATURES
CREATE TABLE Phone_Specs
(
  Brand_Name      VARCHAR2(50)    NOT NULL    REFERENCES Phone_Brands(Brand_Name),
  Brand_Type      VARCHAR2(50)    NOT NULL    REFERENCES Phone_Types(Brand_Type),
  Battery_mAh     NUMBER(4)       NOT NULL    UNIQUE,
  Colour          VARCHAR2(50)    NOT NULL    UNIQUE,
  Camera          NUMBER(3,1)                 UNIQUE,
  Price           NUMBER(5,2)                 UNIQUE   
);


------------------------------------------------------- T4:  INDIVIDUAL PHONES
CREATE TABLE Phones                           
(
  Serial_No       VARCHAR2(50)    NOT NULL,   PRIMARY KEY(Serial_No),
  Brand_Name      VARCHAR2(50)    NOT NULL    REFERENCES Phone_Brands(Brand_Name),
  Brand_Type      VARCHAR2(50)    NOT NULL    REFERENCES Phone_Types(Brand_Type),
  Battery_mAh     NUMBER(4)       NOT NULL    REFERENCES Phone_Specs(Battery_mAh),
  Colour          VARCHAR2(50)    NOT NULL    REFERENCES Phone_Specs(Colour), 
  Camera          NUMBER(3,1)                 REFERENCES Phone_Specs(Camera),
  Price           NUMBER(5,2)                 REFERENCES Phone_Specs(Price)
);
