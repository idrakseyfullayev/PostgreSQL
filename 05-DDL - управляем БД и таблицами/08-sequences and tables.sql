DROP TABLE IF EXISTS book;

CREATE TABLE book
(
	book_id int GENERATED BY DEFAULT AS IDENTITY (START WITH 10 INCREMENT BY 2) NOT NULL,
	title text NOT NULL,
	isbn varchar(32) NOT NULL,
	publisher_id int NOT NULL,

	CONSTRAINT PK_book_book_id PRIMARY KEY(book_id)
);

ALTER TABLE book
ALTER COLUMN book_id RESTART WITH 200

INSERT INTO book(title, isbn, publisher_id)
VALUES
('title', 'isbn', 1);

INSERT INTO book
VALUES
(3, 'title', 'isbn', 1)


	
DROP TABLE IF EXISTS book;


CREATE TABLE book
(
	book_id serial NOT NULL,
	title text NOT NULL,
	isbn varchar(32) NOT NULL,
	publisher_id int NOT NULL,
	
	CONSTRAINT PK_book_book_id PRIMARY KEY(book_id)
);

ALTER SEQUENCE book_book_id_seq RESTART WITH 10


CREATE TABLE book
(
	book_id int GENERATED ALWAYS AS IDENTITY (START WITH 10 INCREMENT BY 2) NOT NULL,
	title text NOT NULL,
	isbn varchar(32) NOT NULL,
	publisher_id int NOT NULL,
	
	CONSTRAINT PK_book_book_id PRIMARY KEY(book_id)
);

ALTER TABLE book
ALTER COLUMN book_id RESTART WITH 200

INSERT INTO book(title, isbn, publisher_id)
VALUES
('title', 'isbn', 1);

INSERT INTO book
OVERRIDING SYSTEM VALUE
VALUES
(3, 'title', 'isbn', 1)


	
DROP TABLE IF EXISTS book;

CREATE TABLE public.book
(
    book_id int NOT NULL,
    title text NOT NULL,
    isbn varchar(32) NOT NULL,
    publisher_id int NOT NULL,
	  
	CONSTRAINT PK_book_book_id PRIMARY KEY(book_id)
);

CREATE SEQUENCE IF NOT EXISTS book_book_id_seq
START WITH 1 OWNED BY book.book_id;

-- doesn't work
INSERT INTO book (title, isbn, publisher_id)
VALUES ('title', 'isbn', 1);

--we need to set default
ALTER TABLE book
ALTER COLUMN book_id SET DEFAULT nextval('book_book_id_seq');

ALTER SEQUENCE book_book_id_seq RESTART WITH 10

	
--now should work
INSERT INTO book (title, isbn, publisher_id)
VALUES ('title', 'isbn', 1);

SELECT * 
FROM book;

INSERT INTO book (title, isbn, publisher_id)
VALUES ('title2', 'isbn2', 1);

SELECT * 
FROM book;

--BTW, we need the list of columns if we skip some of them inserting values
--so the following doesn't work
INSERT INTO book
VALUES ('title2', 'isbn2', 1);

--returning
INSERT INTO book (title, isbn, publisher_id)
VALUES ('title3', 'isbn3', 1)
RETURNING book_id;
