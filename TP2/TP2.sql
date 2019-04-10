/*tp 02*/
--creation des tableaux
CREATE TABLE DEPT (
deptno number(2) primary key ,
dname varchar2(15) 
);
create table emp (
empno number (2) primary key ,
sal number(4),
com number(4) ,
Deptno    NUMBER(2) ,
constraint fk1 FOREIGN key  (deptno)REFERENCES dept(deptno)
);
--exercice 1
set SERVEROUTPUT ON;
declare 
num NUMBER(4) := &numero ;
sal1 number(4);
begin 
SELECT sal into sal1 from emp where empno = num ;
DBMS_OUTPUT.PUT_LINE(sal1);
end ;
--exercice 2
set SERVEROUTPUT ON;
declare 
sal2 NUMBER(4) := &sal ;
commission number(4) := &com;
deptno1 number(4);
empno1 number(4);
begin 
SELECT e.deptno,e.empno into deptno1,empno1 from emp e,dept d  
where d.deptno=e.deptno and sal = sal2 and com = commission;
DBMS_OUTPUT.PUT_LINE('la numero e departement =' ||deptno1);
DBMS_OUTPUT.PUT_LINE('la numero de l employer = '||empno1);
end ;
