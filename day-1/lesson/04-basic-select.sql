-- Lets get our books back
DROP TABLE IF EXISTS bookshelf.book;

-- Create the schema if it doesn't exist
CREATE SCHEMA IF NOT EXISTS bookshelf;

-- Create the book table in the bookshelf schema
CREATE TABLE bookshelf.book (
    book_id BIGSERIAL PRIMARY KEY,
    title VARCHAR(45) NOT NULL,
    author VARCHAR(45) NOT NULL,
    publish_date DATE, -- Allowed to be null because our DB may contain some unpublished books.
    price DECIMAL(6, 2),   -- 6 significant figures, 2 after the decimal, meaning 9999.99 is our "most expensive" possible book.
    CONSTRAINT unique_author_title_publish_date UNIQUE (author, title, publish_date)
);

-- Inserting when all columns are specified
INSERT INTO bookshelf.book (title, author, publish_date, price) VALUES ('Pride and Prejudice', 'Jane Austen', '1813-01-28', 6.99);
INSERT INTO bookshelf.book (title, author, publish_date, price) VALUES ('To Kill a Mockingbird', 'Harper Lee', '1960-07-11', 6.99);
INSERT INTO bookshelf.book (title, author, publish_date, price) VALUES ('The Great Gatsby', 'F. Scott Fitzgerald', '1925-04-10', 12.50);
INSERT INTO bookshelf.book (title, author, publish_date, price) VALUES ('One Hundred Years of Solitude', 'Gabriel García Márquez', '1967-05-05', 8.99);
INSERT INTO bookshelf.book (title, author, publish_date, price) VALUES ('In Cold Blood', 'Truman Capote', '1965-09-25', 4.99);

-- Select everything
SELECT * FROM bookshelf.book;

-- Specify columns
SELECT title, author FROM bookshelf.book;
SELECT publish_date FROM bookshelf.book;

-- MICRO-EXERCISE: select just the book_id and price.
SELECT book_id, price FROM bookshelf.book;

-- Specify rows with where
SELECT * FROM bookshelf.book WHERE publish_date < '1960-01-01'; 
SELECT title FROM bookshelf.book WHERE title LIKE 'T%'; -- This finds titles that start with a T
SELECT DISTINCT price FROM bookshelf.book; -- Finds all the prices, without duplicates.

-- MICRO-EXERCISE: Select all the books that cost less than $5
SELECT * FROM bookshelf.book WHERE price < 5;

-- Sort the results with order by
SELECT * FROM bookshelf.book ORDER BY price DESC;
SELECT * FROM bookshelf.book ORDER BY price ASC;
SELECT * FROM bookshelf.book ORDER BY price; -- Note, if not specified, ASCENDING is used.

-- Limit number of results.
SELECT * FROM bookshelf.book LIMIT 2; -- only return the first 2 results

-- Note that limits apply after sorting with ORDER BY.
SELECT * FROM bookshelf.book ORDER BY publish_date LIMIT 3; -- Which means these are the three "oldest" books.

-- MICRO-EXERCISE: Use ORDER BY and LIMIT to select the two most expensive books.
SELECT * FROM bookshelf.book ORDER BY price DESC LIMIT 2;

-- You can combine multiple where clauses using "and" and "or"
-- With OR any record where at least one of the clauses is true
-- will be returned.
SELECT 
  *
FROM bookshelf.book
WHERE price > 10 OR publish_date > '1950-01-01';

-- With AND only records where both clauses are true will be returned
SELECT 
  *
FROM bookshelf.book
WHERE price < 5 AND publish_date > '1950-01-01';

-- One last useful trick (though there are many more): Use the "BETWEEN" keyword
-- for any type of data that is organized in a range (numbers, dates, even text alphabetically)
-- Note that case matters in most databases, and that all capital letters are before any lowercase letters.
SELECT title FROM bookshelf.book WHERE title BETWEEN 'O' AND 'P'; 
SELECT title FROM bookshelf.book WHERE title BETWEEN 'o' AND 'p';

SELECT publish_date FROM bookshelf.book WHERE publish_date BETWEEN '1950-01-01' AND '1970-01-01';

SELECT price FROM bookshelf.book WHERE price BETWEEN 5 AND 9;

-- You can combine all these features, but they MUST always appear in the proper order (SELECT, COLS, FROM, WHERE, ORDER, LIMIT).
-- Similarly, the features happen in this order, which means this query:
  -- Fetches all the books priced above $5.00,
  -- Then sorts those books by price (in ascending order)
  -- Then returns just the first two results from that sorted list.
SELECT 
  title,
  author,
  price
FROM bookshelf.book
WHERE price > 5
ORDER BY price
LIMIT 2;

-- MICRO-EXERCISE: Write a query which will return just the single most expensive book published
-- after 1925.
SELECT 
  title,
  author,
  price
FROM bookshelf.book
WHERE publish_date > '1925-01-01'
ORDER BY price DESC
LIMIT 1;
