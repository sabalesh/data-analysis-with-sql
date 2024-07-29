# Set Operations

* Set operations can be used to combine the results of separate queries.
* They are similar to JOINs in a way, except that instead of adding columns to the ultimate result, they add rows to the ultimate result. 
* The three set operations are
    * UNION (all results FROM both queries)
    * intersect (only results that appear in both queries)
    * except (all results FROM the first query minus results that appear in the second query)
* By default set operations remove duplicate rows FROM the resulting table.
    * The `all` keyword can be added to any of the set operations to prevent that deduplication FROM happening.
* Result sets must have the same number of columns.
* Lets look at some examples:

```sql
SELECT 1
UNION 
SELECT 2;
```
* Note: as basic as you can get...

```sql
SELECT 1
UNION 
SELECT 1;

-- vs

SELECT 1
UNION ALL
SELECT 1
```
* Note: deduplication in action, or not.

```sql
SELECT 1
UNION ALL
SELECT 1, 2;
```
* Note: produces an error.

* Okay, lets do some real-er examples:

```sql
SELECT 
	CONCAT(p.firstname, ' ', p.middlename, ' ', p.lastname)
FROM employee e
JOIN contact p ON p.contactid=e.contactid
UNION 
	SELECT 
		CONCAT(p.firstname, ' ', p.middlename, ' ', p.lastname)
	FROM customer c
    JOIN individual i ON i.customerid=c.customerid
    JOIN contact p ON i.contactid=p.contactid;
```
* Note: all full names of all employees and customers
* Change the UNION to intersect and except.
    * Intersect is names of people who are both customers AND employees.
    * Except is all the names of employees NOT shared by any customers
    * adding all removes duplicate records.