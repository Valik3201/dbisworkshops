BEGIN;

CREATE TABLE alembic_version (
    version_num VARCHAR(32) NOT NULL, 
    CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num)
);


CREATE TABLE university (
    id SERIAL NOT NULL, 
    name VARCHAR(5) NOT NULL, 
    PRIMARY KEY (id), 
    UNIQUE (name)
);

CREATE TABLE users (
    id SERIAL NOT NULL, 
    email VARCHAR(255) NOT NULL, 
    password VARCHAR(255) NOT NULL, 
    registered_on TIMESTAMP WITHOUT TIME ZONE NOT NULL, 
    admin BOOLEAN NOT NULL, 
    PRIMARY KEY (id), 
    UNIQUE (email)
);

CREATE TABLE fuc (
    id SERIAL NOT NULL, 
    name VARCHAR(5) NOT NULL, 
    university_id INTEGER NOT NULL, 
    PRIMARY KEY (id), 
    FOREIGN KEY(university_id) REFERENCES university (id), 
    UNIQUE (name)
);

CREATE TABLE "group" (
    id SERIAL NOT NULL, 
    name VARCHAR(5) NOT NULL, 
    fuc_id INTEGER NOT NULL, 
    PRIMARY KEY (id), 
    FOREIGN KEY(fuc_id) REFERENCES fuc (id), 
    UNIQUE (name)
);

CREATE TABLE students (
    id SERIAL NOT NULL, 
    email VARCHAR(255) NOT NULL, 
    first_name VARCHAR(255) NOT NULL, 
    last_name VARCHAR(255) NOT NULL, 
    group_id INTEGER NOT NULL, 
    PRIMARY KEY (id), 
    FOREIGN KEY(group_id) REFERENCES "group" (id), 
    UNIQUE (email)
);

INSERT INTO alembic_version (version_num) VALUES ('ba40012b7086');

COMMIT;

