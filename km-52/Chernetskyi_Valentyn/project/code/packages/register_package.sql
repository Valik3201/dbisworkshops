create PACKAGE USER_PACKAGE AS

FUNCTION login_user (
        loginuser      UNI_USER.USER_LOGIN%TYPE,
        passworduser   UNI_USER.USER_PASSWORD%TYPE
    ) RETURN NUMBER;

FUNCTION check_user (
        loginuser      UNI_USER.USER_LOGIN%TYPE
    ) RETURN NUMBER;


  FUNCTION register_user (
        loginuser      UNI_USER.USER_LOGIN%TYPE,
        s_id           STUDENT.CARD_ID%TYPE
    ) RETURN NUMBER;


END USER_PACKAGE;
/

create PACKAGE BODY USER_PACKAGE IS
    
FUNCTION login_user (
        loginuser      UNI_USER.USER_LOGIN%TYPE,
        passworduser   UNI_USER.USER_PASSWORD%TYPE
    ) RETURN NUMBER IS
        res   NUMBER(1);
    BEGIN
        SELECT
            COUNT(*)
        INTO res
        FROM
            UNI_USER
        WHERE
            (UNI_USER.USER_LOGIN = loginuser)
            AND (UNI_USER.USER_PASSWORD = passworduser);

        return(res);
    END login_user;

FUNCTION check_user (
        loginuser      UNI_USER.USER_LOGIN%TYPE
    ) RETURN NUMBER IS
        res   NUMBER(1);
    BEGIN
        SELECT
            COUNT(*)
        INTO res
        FROM
            UNI_USER
        WHERE
            UNI_USER.USER_LOGIN = loginuser;
        return(res);
    END check_user;


FUNCTION register_user (
        loginuser      UNI_USER.USER_LOGIN%TYPE,
    ) RETURN NUMBER IS
        res   NUMBER(1);
    BEGIN
        SELECT
            COUNT(*)
        INTO res
        FROM
            UNI_USER  ON UNI_USER.USER_LOGIN 
        WHERE UNI_USER.USER_LOGIN = loginuser

        return(res);
    END register_student;


END USER_PACKAGE;
/
