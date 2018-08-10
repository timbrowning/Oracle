/*
  DT2112A5 - Case Study 1 - 'PHONE'     
  Tim Browning
  Phone Company (MyPhone) Structure
  
  Date: 26/04/16
*/

alter session set current_schema = DT211C2A5;

-- a) Projection

SELECT * FROM Staff WHERE STAFF_NAME = 'Tim'; -- shows details of the staff with the name tim

-- b) Selection	(Restriction)

SELECT * FROM Billing_Table WHERE Text_Msg_units < 30; -- shows text messages under 30 in the billing table

-- c) Sorting

SELECT DISTINCT * FROM Customer ORDER BY Cust_Name ASC; -- ascending without duplicates
SELECT * FROM Customer ORDER BY Cust_Name DESC; -- descending with duplicates

-- d) Use	of	non-aggregate	functions	in	the	SELECT	list.

SELECT Cust_Name, length(ADDRESS) as LengthOfAddress FROM Customer; -- diplays length of address

-- e) Testing	for	NULLs

DELETE FROM Customer WHERE PHONE_NO = 353874423423;
INSERT INTO Customer(PHONE_NO, CUST_NAME, Email,Serial_Num) VALUES (353874423423,'Johnny','Johnny@gmail.com',987478923523532);
SELECT * FROM Customer WHERE Address IS NULL; -- shows row with a null address
SELECT * FROM Customer WHERE Address IS  NOT NULL; -- shows row without a null address

-- f) Aggregation,	Aggregation	with	‘GROUP	BY’ and	Aggregation	with	‘Having’	clause
SELECT BILLING_NO,Phone_Number, MAX(Total_Units) AS Total_Units FROM DT211C2A5.BILLING_TABLE
LEFT JOIN Customer
ON Customer.Phone_No=Billing_Table.Phone_Number
GROUP BY CUST_NAME, BILLING_NO, Phone_Number; -- joins customer table to billing table, group by Customer name, Billing Number, Phone number

-- g) Use	of	MINUS,	INTERSECT	and	UNION

SELECT Phone_No FROM Customer INTERSECT SELECT Phone_Number FROM Billing_table; -- displays phone numbers in both billing table and customer table
  
SELECT BILLING_NO, Phone_Number,Text_Msg_units    -- shows the use of minus
FROM Billing_Table
WHERE Text_Msg_units > 2
MINUS
SELECT BILLING_NO, Phone_Number,International_call_units
FROM Billing_Table
WHERE International_call_units > 4
ORDER BY 2;   
  
SELECT BILLING_NO FROM Billing_Table -- joins two columns into one
UNION ALL
SELECT Phone_No FROM Customer;

-- h) Use	of	JOIN	...USING,	JOIN...ON	and	joins	implemented	through	the	WHERE	clause

SELECT * FROM Customer LEFT JOIN Billing_Table ON Customer.Phone_No=Billing_Table.BILLING_NO  -- Joins all the columns into one table
WHERE Customer.Phone_No = 353874423423;

-- i) Use	of	outer	joins

SELECT Customer.Cust_Name, Billing_Table.BILLING_NO -- displays customer name with billing number
FROM Customer
FULL OUTER JOIN Billing_Table
ON Customer.Phone_No=Billing_Table.Phone_Number
ORDER BY Customer.Cust_Name;

-- j) Use	of	Sub-queries	

SELECT Phone_Number FROM Billing_Table -- displays phone numbers with cellular data units bigger then 0
WHERE Phone_Number IN (SELECT Phone_No FROM Customer
WHERE Cellular_Data_units > 0);

-- k) A	query	that	would	be	appropriate	to	the	role	
    
SELECT Phone_Number ,Total_Units FROM Billing_Table group by PHONE_NUMBER, Total_Units -- shows phone number using the most units
order by MAX(Total_Units) DESC;
      
      
SELECT COUNT(Staff_No) AS NumberOfOrders FROM Cust_Contract -- displays staff number with the most amount of orders
WHERE Staff_No=6825;

