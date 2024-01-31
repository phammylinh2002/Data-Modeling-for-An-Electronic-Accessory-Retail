-- Query 1
SELECT 
	E.id, 
	name, 
	COUNT(*) AS no_of_sales_invoices
FROM 
	NHAN_VIEN AS E, 
	SALES_INVOICES AS S
WHERE 
	E.id = S.id 
	AND position = 'Sales'
GROUP BY E.id, name;
GO

-- Query 2
SELECT 
	G.name, 
	A.name 
FROM 
	ACCESSORY_GROUPS AS G, 
	ACCESSORIES AS A 
WHERE 
	id = accessory_group_id 
	AND G.id = 'NLK01';
GO

-- Query 3
SELECT 
	I.id, 
    name, 
    quantity 
FROM 
	IMPORT_INVOICES AS I, 
    ACCESSORIES_IN_AN_IMPORT_INVOICE AS AI, 
    ACCESSORIES AS A 
WHERE 
    I.id = AI.import_invoice_id 
    AND AI.accessory_id = A.id 
    AND quantity >= 500
    AND date BETWEEN '2022-01-01' AND '2022-06-30'
ORDER BY quantity DESC, name;
GO

-- Query 4
SELECT 
	C.id, 
	first_name + ' ' + mid_name + ' ' + last_name AS customer_name, 
	A.name AS accessory_name, 
	SUM(quantity) AS no_of_sold_accessories 
FROM 
	CUSTOMERS AS C, 
	SALES_INVOICES AS S, 
	ACCESSORIES_IN_A_SALES_INVOICE AS AIS, 
	ACCESSORIES AS A 
WHERE 
	C.id = S.customer_id 
	AND S.id = AIS.sales_invoice_id 
	AND AIS.accessory_id = A.id 
	AND gender = 'Nam'
	AND birthdate >= '2000-01-01'
GROUP BY C.id, first_name + ' ' + mid_name + ' ' + last_name, A.name
ORDER BY customer_name, no_of_sold_accessories DESC;
GO

-- Query 5
SELECT 
	TOP 3 
	CONCAT(first_name, ' ',mid_name, ' ', last_name) AS customer_name, 
	SUM(quantity*selling_price) AS amount_spent
FROM 
	CUSTOMERS AS C 
	INNER JOIN SALES_INVOICES AS S 
		ON C.id = S.customer_id 
	INNER JOIN ACCESSORIES_IN_A_SALES_INVOICE AS AIS 
		ON S.id = AIS.sales_invoice_id 
	INNER JOIN ACCESSORIES AS A 
		ON AIS.accessory_id = A.id 
WHERE 
	date >= '2022-07-01'
	AND address LIKE '%TP. HCM%'
GROUP BY CONCAT(first_name, ' ',mid_name, ' ', last_name) 
ORDER BY amount_spent DESC;
GO