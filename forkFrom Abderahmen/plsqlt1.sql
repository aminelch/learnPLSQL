/*Exercice 1*/
set SERVEROUTPUT ON ;
declare
    nmax CONSTANT NUMBER(5) := 200;
    vmax VARCHAR2(5):= 5;
begin
    dbms_output.put_line(nmax);
    dbms_output.put_line(vmax);
    
end;





/*Exercice 2*/
1***********************************
declare 
    x date not null := SYSDATE();


    
begin
    dbms_output.put_line(x);

    
   

end;

2************************************
declare 
    x date not null := SYSDATE();
    y Boolean := false;

    
begin
    dbms_output.put_line(x);
    if(y) then
        dbms_output.put_line('true');
    else 
         dbms_output.put_line('false');
    end if;
    
   

end;
3*****************************
declare 
    x date not null := SYSDATE();
    /*y Boolean := false;*/
    d1 date := '03/04/2004';
    d2 date := '05/04/2004';
    y NUMBER;
    
begin
    dbms_output.put_line(x);
    /*if(y) then
        dbms_output.put_line('true');
    else 
         dbms_output.put_line('false');
    end if;*/
    
    y:= d2-d1;
    dbms_output.put_line(y);

end;




/*Exercice 2*/
declare 
   x varchar2(20):= 'Hello';
   y varchar2(30) := 'World';
   z varchar2(50);
    
begin
    z:=x || y; 
    dbms_output.put_line(z);
end;

/*Exercice 4*/
declare 
   msg varchar2(30);

    
begin
    msg := 'Mon premier bloc PL_SQL';
    dbms_output.put_line(msg);
end;
/*Exercice 5*/

 empno
empname
comm
deptno
sal

