system output= on ; 

declare 
 caractere varchar(1)= upper('&caractere'); 
begin 

case 
    when 'A' then 
    dbms_output_line("Excellent");
    when 'B' then 
    dbms_output_line("Très bien");
    when 'C' then
    dbms_output_line("Bien");
    else 
end case ; 

end;