declare

    salaireMensuel NUMBER(20);
    a NUMBER(20) := 0;
    /*Prendre le type de employe sal et employe empname*/
    s employe.sal%Type;
    n employe.empname%Type;
begin
    
    for a in 0 .. 1 Loop
        Select sal,empname into s,n from employe where empno = a +1;
    
    salaireMensuel := s /12;
    dbms_output.put_line('Le salaire du '|| n || ' est ' || salaireMensuel);
        End Loop;
    
    
end;
