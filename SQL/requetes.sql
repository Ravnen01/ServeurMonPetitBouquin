-- Select a book with the average of it's rates

SELECT AVG(C.Rate)
FROM BOOK B, AUTHOR A, BOOK_AUTHOR BA, CRITICISM C
WHERE B.ISBN = BA.IdBook
	AND A.Id = BA.IdAuthor
	AND B.ISBN = C.IdBook
	GROUP BY B.ISBN, B.Title,A.Name,A.Firstname;

-- Select the criticisms of a book
SELECT IdBook, Rate, Comment
FROM CRITICISM C
WHERE IdBook = monParam;

-- Select an author with the number of books he/she wrote
SELECT Name, Firstname, COUNT(IdBook)
FROM AUTHOR, BOOK_AUTHOR
WHERE Id = IdAuthor
GROUP BY Name, Firstname;

-- Search books with a part of the author's name
SELECT ISBN, Title, Name, Firstname
FROM BOOK, AUTHOR, BOOK_AUTHOR
WHERE ISBN = IdBook
	AND IdAuthor = Id
	AND (Name LIKE '%autreParam%' OR Firstname LIKE '%param%')

-- Search books with a part of their name
SELECT ISBN, Title, Name, Firstname
FROM BOOK, AUTHOR, BOOK_AUTHOR
WHERE ISBN = IdBook
	AND IdAuthor = Id
	AND (Title LIKE '%autreParam%')

-- Search books with part of their ISBN
SELECT ISBN, Title, Name, Firstname
FROM BOOK, AUTHOR, BOOK_AUTHOR
WHERE ISBN = IdBook
	AND IdAuthor = Id
	AND (CAST(ISBN AS CHAR) LIKE '%autreParam%')

