CREATE TABLE DEPT(
    deptno NUMBER(10) PRIMARY KEY,
    dname VARCHAR(20)
);

CREATE TABLE EMP(
    empno NUMBER(20) PRIMARY KEY,
    sal NUMBER(20),
    comm NUMBER (20),
    deptno NUMBER (10)
);

set SERVEROUT on;
ALTER TABLE EMP ADD CONSTRAINT EMPFKEY FOREIGN KEY(deptno) references dept(deptno);
INSERT INTO DEPT VALUES(0, 'INFORMATIQUE');

INSERT INTO DEPT VALUES(1,'Mechanique');

INSERT INTO EMP VALUES(0, 1200, 100, 0);
INSERT INTO EMP VALUES(1, 1500, 200, 1);
INSERT INTO EMP VALUES(2, 1000, 200, 1);
INSERT INTO EMP VALUES(3, 1800, 500, 0);

DECLARE 
    n1 NUMBER(10) := &n1;
    n2 NUMBER (10) := &n2;
    res NUMBER(10) := 0;
BEGIN
    res := n1/ n2;
    n2 := n2 + res;
    
    dbms_output.put_line('n1 : ' || n2);
    dbms_output.put_line('res : '|| res);

    
    
END;



/*---------------------------------------------------------------------------------------------------------------------------------*/
EXERCICE 2 
    
    SELECT MAX(deptno) into maxim from dept;
    dbms_output.put_line('Le maximum de deptno est : '|| maxim);..




DECLARE 
    /*n1 NUMBER(10) := &n1;
    n2 NUMBER (10) := &n2;
    res NUMBER(10) := 0;
    maxim number(10) := 0;*/
    depNumber NUMBER(10) := &depNumber;
    moy NUMBER(10) := 0;
BEGIN
    /*res := n1/ n2;
    n2 := n2 + res;
    dbms_output.put_line('n1 : ' || n2);
    dbms_output.put_line('res : '|| res);
    SELECT MAX(deptno) into maxim from dept;
    dbms_output.put_line('Le maximum de deptno est : '|| maxim);*/
    SELECT SUM(sal)INTO moy FROM EMP  WHERE deptno = depNumber;
    dbms_output.put_line('La somme des salaires du departement '|| depNumber || ' est ' || moy);
    
END;






/*---------------------------------------------------------------------------------------------------------------------------------*/
EXERCICE 4


DECLARE 
    /*n1 NUMBER(10) := &n1;
    n2 NUMBER (10) := &n2;
    res NUMBER(10) := 0;
    maxim number(10) := 0;
    depNumber NUMBER(10) := &depNumber;
    moy NUMBER(10) := 0;*/
    
    numberEmp NUMBER (10):= &numberEmp;
    salaireEmp NUMBER(10);
    commission NUMBER(10);
BEGIN
    /*res := n1/ n2;
    n2 := n2 + res;
    dbms_output.put_line('n1 : ' || n2);
    dbms_output.put_line('res : '|| res);
    SELECT MAX(deptno) into maxim from dept;
    dbms_output.put_line('Le maximum de deptno est : '|| maxim);*/
    /*SELECT SUM(sal)INTO moy FROM EMP  WHERE deptno = depNumber;
    dbms_output.put_line('La somme des salaires du departement '|| depNumber || ' est ' || moy);*/
    select sal into salaireEmp from EMP where empno = numberEmp;
    if salaireEmp < 1000 then
        commission := (salaireEmp * 10) / 100;
        dbms_output.put_line('NOUVELLE COMMSSION = '|| commission);
        UPDATE EMP SET comm = commission where empno = numberEmp;
    else if salaireEmp >= 100 AND salaireEmp <= 1500 then
        commission := (salaireEmp * 15) / 100;
        UPDATE EMP SET comm = commission where empno = numberEmp;
    else if salaireEmp > 1500 then
        commission := (salaireEmp * 20) / 100;
        UPDATE EMP SET comm = commission where empno = numberEmp;
        
    end if;
    end if;
    end if;
    
END;






