set serveroutpout = on ; 
declare 
    ma_constante varchar(20) := 'Hello ';
begin
 dbsm_output_put_line (ma_constante);
end ;