CREATE TABLE person
(
	person_id int PRIMARY KEY,
	first_name varchar(64) NOT NULL,
	last_name varchar(64) NOT NULL
);

CREATE TABLE passport
(
	passport_id int PRIMARY KEY,
	serial_number int NOT NULL,
	fk_passport_person int UNIQUE REFERENCES person(person_id)
);

INSERT INTO person VALUES (1, 'John', 'Snow');
INSERT INTO person VALUES (2, 'Ned', 'Stark');
INSERT INTO person VALUES (3, 'Rob', 'Baratheon');

ALTER TABLE passport
ADD COLUMN registration text NOT NULL;

INSERT INTO passport VALUES (1, 123456, 1, 'Winterfell');
INSERT INTO passport VALUES (2, 789012, 2, 'Winterfell');
INSERT INTO passport VALUES (3, 345678, 3, 'King''s Landing');


Отношение много к многим

DROP TABLE IF EXISTS book
DROP TABLE IF EXISTS author

CREATE TABLE book
(
	book_id int PRIMARY KEY,
	titl text NOT NULL,
	isbn text NOT NULL
);

CREATE TABLE author
(
	author_id int PRIMARY KEY,
	full_name text NOT NULL,
	rating real NOT NULL
);

CREATE TABLE book_author
(
	book_id int REFERENCES book(book_id),
	author_id int REFERENCES author(author_id),
	
	CONSTRAINT book_author_pkey PRIMARY KEY (book_id, author_id) -- composite key
);

INSERT INTO book
VALUES
(1, 'Book of Dummies', '123456'),
(2, 'Book of Smart Guys', '7890123'),
(3, 'Book of Happy People', '4567890'),
(4, 'Book of Unhappy People', '1234567');

INSERT INTO author
VALUES
(1, 'Bob', 4.5),
(2, 'Alice', 4.0),
(3, 'John', 4.7);

INSERT INTO book_author
VALUES
(1, 1),
(2, 1),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(4, 3);


