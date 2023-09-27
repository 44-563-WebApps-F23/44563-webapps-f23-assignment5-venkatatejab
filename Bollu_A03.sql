CREATE TABLE Author(
authorId int NOT NULL,
firstName varchar(15),
lastName varchar(35),
PRIMARY KEY (authorId)
)


CREATE TABLE Book(
bookId int NOT NULL,
bookName varchar(15),
description varchar(45),
authorId int,
publisherId int,
PRIMARY KEY (bookId),
FOREIGN KEY (authorId) REFERENCES Author(authorId),
FOREIGN KEY (publisherId) REFERENCES Publisher(publisherId)
)


CREATE TABLE Publisher(
publisherId int NOT NULL,
publisherName varchar(35),
noOfPublications int,
PRIMARY KEY publisherId
)


--2. Insert three records into each table; One of your Author records must contain (‘William’,‘Shakespeare’) as the First Name…
[8:24 PM, 9/22/2023] VR: --1. Create all tables and relationships (include all primary keys, foreign keys, attributes, and appropriate data types) for the ERD above.


CREATE TABLE Author(
authorId int NOT NULL,
firstName varchar(50),
lastName varchar(50),
PRIMARY KEY (authorId)
);


CREATE TABLE Publisher(
publisherId int NOT NULL,
publisherName varchar(50),
noOfPublications int,
PRIMARY KEY (publisherId)
);


CREATE TABLE Book(
bookId int NOT NULL,
bookName varchar(50),
descriptions varchar(100),
authorId int,
publisherId int,
PRIMARY KEY (bookId),
FOREIGN KEY (authorId) REFERENCES Author(authorId),
FOREIGN KEY (publisherId) REFERENCES Publisher(publisherId)
);


--2. Insert three records into each table; One of your Author records must contain (Ã¢â‚¬ËœWilliamÃ¢â‚¬â„¢,Ã¢â‚¬ËœShakespeareÃ¢â‚¬â„¢) as the First Name and Last Name, respectively. BOOK table should have at least two entries for each PUBLISHER.


INSERT INTO Author (authorId,firstName,lastName) VALUES (1,'William','Shakespeare');
INSERT INTO Author (authorId,firstName,lastName) VALUES (2,'Kerin', 'james');
INSERT INTO Author (authorId, firstName, lastName) VALUES (3, 'kevin', 'cobby');


INSERT INTO Publisher (publisherId, publisherName, noOfPublications) VALUES (1, 'lisa', 3);
INSERT INTO Publisher (publisherId, publisherName, noOfPublications) VALUES (2, 'amy', 2);
INSERT INTO Publisher (publisherId, publisherName, noOfPublications) VALUES (3, 'lola', 2);


INSERT INTO Book (bookId, bookName, description, authorId, publisherId) VALUES (1, 'hollow choclate', 'Thriller book', 1, 1);
INSERT INTO Book (bookId, bookName, description, authorId, publisherId) VALUES (2, 'eat shoot love', 'Motivational book', 2, 2);
INSERT INTO Book (bookId, bookName, description, authorId, publisherId) VALUES (3, 'unforgettable love', 'Novel', 3, 3);
INSERT INTO Book (bookId, bookName, description, authorId, publisherId) VALUES (4, 'alien friend', 'imaginal fiction', 1, 1);
INSERT INTO Book (bookId, bookName, description, authorId, publisherId) VALUES (5, 'mr lizard', 'Zombies novel', 2, 2);
INSERT INTO Book (bookId, bookName, description, authorId, publisherId) VALUES (6, 'hidden love', 'experience of love', 3, 3);

--3. Insert a record into the BOOK table, display only the fourth record and delete that record (the fourth record is of your wish). Display all the records after deletion.


INSERT INTO Book (bookId,bookName,descriptions,authorId,publisherId) VALUES (4, 'alien friend', 'imaginal fiction', 1, 1);
SELECT * from Book where bookId=04;
DELETE from Book where bookId=04;
SELECT * from Book;

--4. Alter the AUTHOR table so that the first name attribute has type VARCHAR(10)

ALTER TABLE Author
MODIFY firstName varchar(10);

--5. Update the 'William Shakespeare' record 

UPDATE Author
SET firstName='JK',lastName='Rowling'
where authorId=1;

--6. Display the author firstname,author lastname,book name,and publisher name for all the books;the output should be sorted by book name in ascending order

SELECT Author.firstName,Author.lastName,Book.bookName,Publisher.publisherName
from Author
JOIN Book on Author.authorId=Book.authorId
JOIN Publisher on Book.publisherId=Publisher.publisherId
ORDER BY bookName ASC;

--7.Display the total number of books written by each author (think about GROUP BY)

SELECT Author.firstName,Author.lastName,count(Book.bookId) as Totalbooks
from Author
JOIN Book on Author.AuthorId=Book.AuthorId
GROUP BY Author.firstName,Author.lastName;

--8.Commit the Database

COMMIT;

--9. Display all data in all tables separately (do not use a join; use multiple SELECT statements)

SELECT * FROM Author;
SELECT * FROM Book;
SELECT * FROM Publisher;

--10. Drop all tables in the Database; in a comment in your sql file answer the question: Why must you drop the tables in a specific order?

DROP TABLE Book;
DROP TABLE Publisher;
DROP TABLE Author;

/*Dropping tables in the proper order is crucial because those that require a foreign key must come before those to which they relate. Foreign key limitations must be adhered to in order to use the main key from the supplied table. The referenced table must be removed before the foreign key restriction table to avoid an error.
*/

--11. Roll back the database

ROLLBACK;

--12. Display all data in all tables separately (do not use a join)
SELECT * FROM Author;
SELECT * FROM Book;
SELECT * FROM Publisher;

--13. Explain the output you get from problem 12. Put your answer as a comment in the sql file.
/*The solution for problem 12 shows the contents of each table separately. In issue 12, each SELECT line presents a separate result set that includes all the rows and columns from each table that were selected.
*/

--14. What is the difference between drop, truncate, and delete? Put your answer as a comment in the sql file.

/*DROP- Drops the complete table from the database.
  TRUNCATE- Deletes the complete records from an existing table which means resets the table without removing it from the database.
  DELETE- Deletes one or more specific rows from the existing table in the database  
*/

--15. What are the different aggregate functions we have, specify? Put your answer as a comment in the sql file.
/*Aggregare functions:
  1.sum()- Provides total sum of a numeric column.
  2.avg()- Provides average value of a numeric column.
  3.min()- Provides the lowest value of a specified column.
  4.max()- Provides the highest value of a specified column.
  5.count()- Provides the count of rows that are present in specified column.
*/