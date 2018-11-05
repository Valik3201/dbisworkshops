
CREATE TABLE "students" (
    st_id INT NOT NULL, 
    st_email VARCHAR(255) NOT NULL, 
    st_first_name VARCHAR(255) NOT NULL, 
    st_last_name VARCHAR(255) NOT NULL, 
    PRIMARY KEY (st_id), 
    UNIQUE (st_email)
);


INSERT INTO "students" (st_id, st_email, st_first_name, st_last_name)
VALUES (1, 'first_name1@com', 'first_name1', 'first_name1');

INSERT INTO "students" (st_id, st_email, st_first_name, st_last_name)
VALUES (2, 'first_name1@com', 'first_name2', 'first_name2');

INSERT INTO "students" (st_id, st_email, st_first_name, st_last_name)
VALUES (3, 'first_name3@com', 'first_name3', 'first_name3');

INSERT INTO "students" (st_id, st_email, st_first_name, st_last_name)
VALUES (4, 'first_name3@com', 'first_name4', 'first_name4');

-- TASK1

SELECT * from "students"
ORDER BY st_id;

INSERT INTO "students" (st_id, st_email, st_first_name, st_last_name)
VALUES (2, 'first_name2@com', 'first_name2', 'first_name2');


