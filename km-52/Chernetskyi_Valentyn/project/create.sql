CREATE TABLE "fuculty" (
  "id" SERIAL CONSTRAINT "pk_fuculty" PRIMARY KEY,
  "name" VARCHAR(255) NOT NULL
);

CREATE TABLE "group" (
  "id" SERIAL CONSTRAINT "pk_group" PRIMARY KEY,
  "name" VARCHAR(255) NOT NULL
);

CREATE TABLE "fuculty_group_id" (
  "fuculty" INTEGER NOT NULL,
  "group" INTEGER NOT NULL,
  CONSTRAINT "pk_fuculty_group_id" PRIMARY KEY ("fuculty", "group")
);

CREATE INDEX "idx_fuculty_group_id" ON "fuculty_group_id" ("group");

ALTER TABLE "fuculty_group_id" ADD CONSTRAINT "fk_fuculty_group_id__fuculty" FOREIGN KEY ("fuculty") REFERENCES "fuculty" ("id");

ALTER TABLE "fuculty_group_id" ADD CONSTRAINT "fk_fuculty_group_id__group" FOREIGN KEY ("group") REFERENCES "group" ("id");

CREATE TABLE "university" (
  "id" SERIAL CONSTRAINT "pk_university" PRIMARY KEY,
  "name" VARCHAR(255) NOT NULL
);

CREATE TABLE "fuculty_university_id" (
  "university" INTEGER NOT NULL,
  "fuculty" INTEGER NOT NULL,
  CONSTRAINT "pk_fuculty_university_id" PRIMARY KEY ("university", "fuculty")
);

CREATE INDEX "idx_fuculty_university_id" ON "fuculty_university_id" ("fuculty");

ALTER TABLE "fuculty_university_id" ADD CONSTRAINT "fk_fuculty_university_id__fuculty" FOREIGN KEY ("fuculty") REFERENCES "fuculty" ("id");

ALTER TABLE "fuculty_university_id" ADD CONSTRAINT "fk_fuculty_university_id__university" FOREIGN KEY ("university") REFERENCES "university" ("id");

CREATE TABLE "user" (
  "id" SERIAL CONSTRAINT "pk_user" PRIMARY KEY,
  "email" VARCHAR(255) UNIQUE,
  "password" VARCHAR(255) NOT NULL,
  "registered_on" DATE,
  "admin" BOOLEAN
);

CREATE TABLE "student" (
  "id" SERIAL CONSTRAINT "pk_student" PRIMARY KEY,
  "email" VARCHAR(255) UNIQUE,
  "first_name" VARCHAR(255) NOT NULL,
  "last_name" VARCHAR(255) NOT NULL,
  "user_1" INTEGER NOT NULL,
  "user_2" INTEGER NOT NULL
);

CREATE INDEX "idx_student__user_1" ON "student" ("user_1");

CREATE INDEX "idx_student__user_2" ON "student" ("user_2");

ALTER TABLE "student" ADD CONSTRAINT "fk_student__user_1" FOREIGN KEY ("user_1") REFERENCES "user" ("id");

ALTER TABLE "student" ADD CONSTRAINT "fk_student__user_2" FOREIGN KEY ("user_2") REFERENCES "user" ("id");

CREATE TABLE "group_student_id" (
  "group" INTEGER NOT NULL,
  "student" INTEGER NOT NULL,
  CONSTRAINT "pk_group_student_id" PRIMARY KEY ("group", "student")
);

CREATE INDEX "idx_group_student_id" ON "group_student_id" ("student");

ALTER TABLE "group_student_id" ADD CONSTRAINT "fk_group_student_id__group" FOREIGN KEY ("group") REFERENCES "group" ("id");

ALTER TABLE "group_student_id" ADD CONSTRAINT "fk_group_student_id__student" FOREIGN KEY ("student") REFERENCES "student" ("id")
--Create users

INSERT INTO "user" (USER_ID, USER_EMAIL, USER_PASSWORD, USER_REGISTERED_ON, USER_ADMIN) 
  VALUES ('1', 'gmail', 'Ivan', TO_DATE('2017-10-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), false);
INSERT INTO "user" (USER_ID, USER_EMAIL, USER_PASSWORD, USER_REGISTERED_ON, USER_ADMIN)
  VALUES ('2', 'ukrnet', 'Petro', TO_DATE('2007-09-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), false);
  INSERT INTO "user" (USER_ID, USER_EMAIL, USER_PASSWORD, USER_REGISTERED_ON, USER_ADMIN) 
  VALUES ('3', 'mailru', 'Vasyl', TO_DATE('2017-10-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), false);
INSERT INTO "user" (USER_ID, USER_EMAIL, USER_PASSWORD, USER_REGISTERED_ON, USER_ADMIN)
  VALUES ('4', 'yandex', 'Dima', TO_DATE('2017-09-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), false);

--Create students
INSERT INTO "student" (STUDENT_ID, STUDENT_EMAIL, FIRST_NAME, SECOND_NAME)
  VALUES ('1', 'gmail', 'Ivan', 'QWERTY');
INSERT INTO "student" (STUDENT_ID, STUDENT_EMAIL, FIRST_NAME, SECOND_NAME)
  VALUES ('2', 'ukrnet', 'Petro', 'ASDFGH');
INSERT INTO "student" (STUDENT_ID, STUDENT_EMAIL, FIRST_NAME, SECOND_NAME)
  VALUES ('3', 'mailru', 'Vasyl', 'IUHGIUGGI');
INSERT INTO "student" (STUDENT_ID, STUDENT_EMAIL, FIRST_NAME, SECOND_NAME)
  VALUES ('4', 'yandex', 'Dima', 'JKHJKHKJH');

--Create groups
INSERT INTO "group" (GROUP_ID, GROUP_NAME) 
  VALUES ('1', 'KM1111');
INSERT INTO "group" (GROUP_ID, GROUP_NAME) 
  VALUES ('2', 'KM2222');
INSERT INTO "group" (GROUP_ID, GROUP_NAME) 
  VALUES ('3', 'KM3333');
INSERT INTO "group" (GROUP_ID, GROUP_NAME) 
  VALUES ('4', 'KM4444');
  
--Create faculties
INSERT INTO "faculty" (FACULTY_ID, FACULTY_NAME) 
  VALUES ('1', 'MMMMMMMMM');
INSERT INTO "faculty" (FACULTY_ID, FACULTY_NAME) 
  VALUES ('2', 'JJJJJJJJJ');
INSERT INTO "faculty" (FACULTY_ID, FACULTY_NAME) 
  VALUES ('3', 'JIHKJHJJJ');
INSERT INTO "faculty" (FACULTY_ID, FACULTY_NAME) 
  VALUES ('4', 'FXTFTFCYCGY');
  
--Create universities
INSERT INTO "university" (UNIVER_ID, UNIVER_NAME) 
  VALUES ('1', 'KPI');
INSERT INTO "university" (UNIVER_ID, UNIVER_NAME) 
  VALUES ('2', 'KNU');
INSERT INTO "university" (UNIVER_ID, UNIVER_NAME) 
  VALUES ('3', 'NAU');
INSERT INTO "university" (UNIVER_ID, UNIVER_NAME) 
  VALUES ('4', 'KNEU');
