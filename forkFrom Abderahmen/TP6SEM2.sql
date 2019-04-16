
DECLARE 
    /*n1 NUMBER(10) := &n1;
    n2 NUMBER (10) := &n2;
    res NUMBER(10) := 0;
    maxim number(10) := 0;
    depNumber NUMBER(10) := &depNumber;
    moy NUMBER(10) := 0;
    
    numberEmp NUMBER (10):= &numberEmp;
    salaireEmp NUMBER(10);
    commission NUMBER(10);*/
    Type deptTab is Table of VARCHAR(20) INDEX BY BINARY_INTEGER;
    depTab deptTab;
    nd dept.dname%Type;
    i NUMBER(10) := 0;
BEGIN
    /*res := n1/ n2;
    n2 := n2 + res;
    dbms_output.put_line('n1 : ' || n2);
    dbms_output.put_line('res : '|| res);
    SELECT MAX(deptno) into maxim from dept;
    dbms_output.put_line('Le maximum de deptno est : '|| maxim);*/
    /*SELECT SUM(sal)INTO moy FROM EMP  WHERE deptno = depNumber;
    dbms_output.put_line('La somme des salaires du departement '|| depNumber || ' est ' || moy);
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
    end if;*/

    for i IN 0 .. 1 loop 
    select DNAME INTO nd from DEPT where deptno = i;
       depTab(i) :=  nd ;
    end loop;
    
    for i IN depTab.FIRST .. depTab.LAST loop 
        dbms_output.put_line(depTab(i));
    end loop;
    
END;



