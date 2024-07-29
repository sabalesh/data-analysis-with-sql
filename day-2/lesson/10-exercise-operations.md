# Exercise: Operations

Before attempting this exercise, you'll have to have restored the AdventureWorks backup included in this repo. Follow the steps laid out in `08s-solution-restore-and-explore` to do so.

## The Exercise:

Write a SQL query for each of the following prompts.

1. Select the full names of the people from `contact` whose last name is longer than 10 characters.

2. Select the `orderqty`, and `scrappedqty` from `workorder` and also compute the percent of the total order that was scrapped for each order. Hint: if you forget to "CAST" the input data, you might get an unexpected result.

3. Using the `-` operator, expand your answer from number 2 to include the number of days that elapsed between `startdate` and `enddate`.

4. For every entry in the `address` table compute the full mailing address, including proper line breaks for each section of the address. 

This might be harder than it seems at first...
 

Hint 1: the coalesce function might help as well

Hint 2: You need to use a join, because some of the information you need is in the `stateprovince` table, and some more is in the `countryregion` table. Use joins!
