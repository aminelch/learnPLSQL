set serveroutpout = on ; 

declare 
    /* nom variable  type := valeur;  */
    
    variable1 varchar(20):='Salut la planète' ; 

begin

/* pour afficher un ligne au console on utilise dbsm_output_put_line 
   pour contactiner une chaine à un var on utilise || 
 */

 dbsm_output_put_line ('la valeur de la variable =' ||variable1);
end ;     