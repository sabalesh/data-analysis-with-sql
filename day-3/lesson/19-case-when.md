# The Case/When Operation

* The CASE statement is a way to process a range of values into a set of discrete values.
* It can also be used to compare values from several columns in a row and generate a new column as a result.
* If you're familiar with other programming languages, this is more or less SQL's if statement.
* Let's look at a couple examples:

```sql
SELECT 
  CONCAT(p.firstname, ' ', p.middlename, ' ', p.lastname) AS name,
  CASE
    WHEN e.maritalstatus='M' THEN 'married'
	ELSE 'single'
  end AS martial_status
FROM employee e
JOIN contact p ON p.contactid=e.contactid;
```

```sql
SELECT 
  CONCAT(p.firstname, ' ', p.middlename, ' ', p.lastname) AS name,
  CASE
    WHEN e.maritalstatus='M' AND e.gender='F' THEN 'married woman'
	WHEN e.maritalstatus='M' THEN 'married man'
	WHEN e.gender='F' THEN 'single woman'
	ELSE 'single man'
  END AS martial_status
FROM employee e
JOIN contact p ON p.contactid=e.contactid;
```

* Notes: 
    * When values are considered in order... that's especially important to the behavior of the second of these which doesn't always specify the value of each relevant column, because it assumes the above `WHEN`'s resulted in false.
    * You can combine boolean statements with and/or.
    * If you don't specify an else the value for unmatched cases will be `NULL`