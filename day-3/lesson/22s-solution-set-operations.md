# Exercise: Set Operations

1. You've been charged with creating a query that powers a dropdown menu that can be used to SELECT the name of every product individually as well as an option for "all products". Use a UNION statement to create such a query.

```sql
SELECT 'All Products' AS name
UNION all
(SELECT name FROM product
ORDER BY name);
```

* Note: What happens if you remove the parenthesis?
    * Answer: it sorts the entire query AFTER the UNION happens. But we'd rather have "all" first followed by the alphabetical list of products.


2. Create a query using `WHERE IN` to identify all the lastnames that are shared by an employee and a customer that is an individual (rather than a store).

```sql
SELECT 
  p.lastname
FROM employee e
JOIN contact p ON p.contactid=e.contactid
WHERE p.lastname IN
	(SELECT 
	  p.lastname
	FROM customer c
    JOIN individual i ON c.customerid=i.customerid
	JOIN contact p ON i.contactid=p.contactid);
```