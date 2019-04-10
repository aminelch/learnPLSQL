/*TP 01*/
--exercice 1
declare 
nmax CONSTANT int  :=200 ;
v varchar2(20) ;
begin 

DBMS_OUTPUT.PUT_LINE(nmax);
end;
--exercice 2
--1
declare 
x date  ; 
begin 
dbms_output.put_line(x);
END;


--2
declare 
x boolean := true ; 
begin 
DBMS_OUTPUT.PUT_LINE(x);
END;
--3
declare 
d1 date := '3/4/2004'; 
d2 date := '5/4/2004';
res number ; 
begin 
res := d2-d1 ; 
dbms_output.put_line(to_char(res));
END;
--exercice 3
declare 
x varchar(20) := 'hello' ; 
y varchar (30) := 'world' ; 
z varchar (50) ; 
begin 
z:= x || y ; 
DBMS_OUTPUT.put_line(z);
END;
--exercice 4
set SERVEROUTPUT ON;
declare 


begin 
DBMS_OUTPUT.PUT_LINE(message);
END;
--exercice 5
--1
declare 
SA number(6,2) := &valeur_sa;
SM number(6,2) ;

begin 
sm := sa/12 ; 
DBMS_OUTPUT.PUT_LINE('la salaire mensuel' ||sm);
END;
--2
declare 
sm number(6,2) ;
sa number (6,2) ;
begin 
select sal into sa from emp where empno like 'wifek' ; 
sm := sa/12 ; 
DBMS_OUTPUT.PUT_LINE(sm) ;

END;
--exercice 6
set SERVEROUTPUT ON;
declare 
prix number(6,2) := &prix ;
begin 
if prix<100 then 
dbms_output.put_line(prix*0.3) ; 
end if ;

if prix>100 and  prix<150 then 
dbms_output.put_line(prix*0.5) ; 
end if ;

if prix>150 then 
dbms_output.put_line(prix*0.7) ; 
end if ;
END;
