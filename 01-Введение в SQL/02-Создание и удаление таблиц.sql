CREATE TABLE publisher
(
	publisher_id integer PRIMARY KEY,
	org_name varchar(128) NOT NULL,
	address text NOT NULL
);

CREATE TABLE book
(
	book_id integer PRIMARY KEY,
	title text NOT NULL,
	isbn varchar(32) NOT NULL
);

DROP TABLE publisher;
DROP TABLE book;


CREATE TABLE public.book
(
    book_id integer NOT NULL,
    title text NOT NULL,
    isbn character varying(32) NOT NULL,
    CONSTRAINT pk_book_id PRIMARY KEY (book_id)
)
WITH (
    OIDS = FALSE
);

ALTER TABLE IF EXISTS public.book
    OWNER to postgres;
