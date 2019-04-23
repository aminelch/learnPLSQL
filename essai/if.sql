system output on;

declare
    nom varchar(255) not null := ""; 

begin 
    nom = upper('&nom');

if nom = 'Amine' then 
dbms_output_line("Correspedance de noms");
elsif nom ='Joe' then 
dbms_output_line("Not OK");
else 
dbms_output_line("Nom inconnu");
end if ; 

