set SERVEROUT on;


declare 

prix NUMBER(10) := &prix;
prixFinal NUMBER(10) := 0;
begin
    if prix < 100 then
        prixFinal := (prix * 30) / 100;
        else if prix >= 100 AND prix < 150 then
            prixFinal := (prix * 50) / 100;
            else if prix >= 150 then
                prixFinal := (prix *70) /100;
                end if;
            end if;
        end if;
    
    dbms_output.put_line('prix  final: ' || prixFinal);
end;