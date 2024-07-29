# Exercise: Case/When

1. Use a case statement to SELECT the name of each product in the `product` table as well as a column named "customer_segment" that contains:
    1. "Luxury" if the list price is more than $1500
    2. "HENRY" if the list price is between $1500 and $500
    3. "Standard" if the list price is less than $500

```sql
SELECT 
  name,
  listprice,
  CASE
    WHEN listprice > 1500 THEN 'Luxury'
	WHEN listprice > 500  THEN 'HENRY'
	ELSE 'Standard'
  END AS product_type
FROM product
ORDER BY listprice;
```

2. AdventureWorks is initiating a mandatory vacation policy for employees who have accumulated too many vacation hours. Write a query that uses case/when and does the following:
    1. Ignores inactive employees.
    2. Includes the employee's name, role, number of accumulated vacation hours and a column which reads:
        * "Mandatory vacation" if the vacation hours are > 40
        * "gentle reminder" if the vacation hours are between 39 and 30
        * "No action" otherwise.

```sql
SELECT 
  CONCAT(p.firstname, ' ', p.middlename, ' ', p.lastname) AS name,
  CASE
    WHEN vacationhours > 40 THEN 'Mandatory vacation'
	WHEN vacationhours > 30 THEN 'Gentle reminder'
	ELSE 'no action'
  END AS vacation_action
FROM employee e
join contact p ON p.contactid=e.contactid
where currentflag=true
ORDER BY vacation_action;
```

3. Use an aggregate and a case statement to SELECT all `purchasing.productvendors` and a column that indicates for each entry if that productvendor has a higher `averageleadtime` than the global average across all products. That column should read "More Lead Time" if so, and "Standard Lead Time" if not.

```sql
SELECT 
  p.name,
  v.name,
  pv.averageleadtime,
  CASE 
    WHEN 
	  averageleadtime > (SELECT AVG(averageleadtime) FROM productvendor)
	  THEN 'More Lead Time'
	ELSE 'Standard Lead Time'
  END
FROM productvendor pv
JOIN vendor v ON v.vendorid=pv.vendorid
JOIN product p ON p.productid=pv.productid
ORDER BY averageleadtime;
```