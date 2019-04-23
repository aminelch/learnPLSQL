server output on; 
declare 

type tab is table of varchar(3);

BEGIN

tab(0) := 'rouge';
tab(1) := 'jaune';
tab(2) := 'bleau';

for i in 0..2 loop 
    dbms_output_line("Couleur : " || tab(i));
end loop ; 

END; 