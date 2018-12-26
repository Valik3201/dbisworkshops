CREATE OR REPLACE PACKAGE STUDENT_PACKAGE AS

TYPE STUDENT_INFO_RECORD IS RECORD (

    ST_LAST_NAME        STUDENT.STUDENT_LAST_NAME%TYPE

);

TYPE STUDENT_INFO_TABLE IS 
    TABLE OF STUDENT_INFO_RECORD;


    FUNCTION GET_STUDENT_INFO
    RETURN STUDENT_INFO_TABLE PIPELINED;

	
    PROCEDURE ADD_STUDENT(
		ST_FIRST_NAME STUDENT.STUDENT_FIRST_NAME%TYPE,
		ST_LAST_NAME STUDENT.STUDENT_LAST_NAME%TYPE,
		ST_UNIVERSITY_NAME UNIVERSITY.UNIVERSITY_NAME%TYPE,
		ST_FACULTY_NAME FACULTY.FACULTY_NAME%TYPE,
		ST_GROUP_NAME ST_GROUP.GROUP_NAME%TYPE
    );

END STUDENT_PACKAGE;
/

CREATE OR REPLACE PACKAGE BODY STUDENT_PACKAGE IS

    FUNCTION GET_STUDENT_INFO
    RETURN STUDENT_INFO_TABLE 
        PIPELINED
    IS
    BEGIN
    FOR PIECE IN (
        SELECT DISTINCT  STUDENT_LAST_NAME
        FROM STUDENT
    ) LOOP
        PIPE ROW (PIECE);
    END LOOP;
    END GET_STUDENT_INFO;
    
    
    PROCEDURE ADD_STUDENT(
		ST_FIRST_NAME       STUDENT.STUDENT_FIRST_NAME%TYPE,
		ST_LAST_NAME        STUDENT.STUDENT_LAST_NAME%TYPE,
		ST_UNIVERSITY_NAME  UNIVERSITY.UNIVERSITY_NAME%TYPE,
		ST_FACULTY_NAME     FACULTY.FACULTY_NAME%TYPE,
		ST_GROUP_NAME       ST_GROUP.GROUP_NAME%TYPE
    )
    IS
    BEGIN
	INSERT INTO STUDENT (STUDENT_FIRST_NAME, STUDENT_LAST_NAME, UNIVERSITY_NAME, FACULTY_NAME, GROUP_NAME)
    VALUES (ST_FIRST_NAME, ST_LAST_NAME, ST_UNIVERSITY_NAME, ST_FACULTY_NAME, ST_GROUP_NAME);
    COMMIT;
    END ADD_STUDENT;

    
END STUDENT_PACKAGE;
/

SELECT * FROM TABLE(STUDENT_PACKAGE.GET_STUDENT_INFO);
