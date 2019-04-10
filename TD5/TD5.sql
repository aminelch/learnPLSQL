/*------TD n° 5 */
/*exercice 01 */
set SERVEROUTPUT ON;
declare 
a number(3) := &taper_a ;
b number(3) := &taper_b ;

begin 
a := a/b ; 
b:= b+a ; 
DBMS_OUTPUT.PUT_LINE( 'a='||a||'b='||b);
end ;
/*exercice 02 */ 
set SERVEROUTPUT ON;
declare 
a number(4) ;

begin 
select max(deptno) into a FROM emp ;
DBMS_OUTPUT.put_line(a);
end ;
/*exercice 03*/
set SERVEROUTPUT ON;
declare 
a number(4) ;

begin 
select sum(sal) into a FROM emp ;
DBMS_OUTPUT.put_line(a);
end ;
/*exercice 04*/
set SERVEROUTPUT ON;
declare 
a number(4):=  &a ;
emp number(4);
sal1 number(4);
begin 
insert into emp values ('10','1750','100','2');
 
select empno,sal into emp,sal1 from emp where empno=a; 
if sal1<1000 then 
UPDATE emp SET com=sal*0.1 ;
end if ; 
if sal1>1000 and sal1<1500 then 

UPDATE emp SET com=sal*0.15 ;
end IF;
if sal1>1500 then  
UPDATE emp SET com=sal*0.2 ;
end if ; 
end;

