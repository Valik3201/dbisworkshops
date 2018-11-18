CREATE TABLE "university" (
    univer_id INT NOT NULL, 
    univer_name VARCHAR(5) NOT NULL, 
    PRIMARY KEY (univer_id), 
    UNIQUE (univer_name)
);

CREATE TABLE "users" (
    user_id INT NOT NULL, 
    user_email VARCHAR(255) NOT NULL, 
    user_password VARCHAR(255) NOT NULL, 
    registered_on TIMESTAMP WITH TIME ZONE NOT NULL, 
    user_admin BOOLEAN NOT NULL, 
    PRIMARY KEY (user_id), 
    UNIQUE (user_email)
);

CREATE TABLE "faculty" (
    faculty_id INT NOT NULL, 
    faculty_name VARCHAR(5) NOT NULL, 
    university_id INT NOT NULL, 
    PRIMARY KEY (faculty_id), 
    FOREIGN KEY(university_id) REFERENCES "university" (univer_id), 
    UNIQUE (faculty_name)
);

CREATE TABLE "group" (
    groups_id INT NOT NULL, 
    group_name VARCHAR(5) NOT NULL, 
    fac_id INTEGER NOT NULL, 
    PRIMARY KEY (groups_id), 
    FOREIGN KEY(fac_id) REFERENCES "faculty" (faculty_id), 
    UNIQUE (group_name)
);


CREATE TABLE "students" (
    st_id INT NOT NULL, 
    st_email VARCHAR(255) NOT NULL, 
    st_first_name VARCHAR(255) NOT NULL, 
    st_last_name VARCHAR(255) NOT NULL, 
    groups_st_id INT NOT NULL, 
    PRIMARY KEY (st_id), 
    FOREIGN KEY(groups_st_id) REFERENCES "group" (groups_id), 
    UNIQUE (st_email)
);
