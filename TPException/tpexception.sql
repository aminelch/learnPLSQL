SET SERVEROUT ON 

/************** a ******************/

DECLARE 
    CURSOR c1 IS SELECT numfour.fournisseur ,typeprod.produit FROM fournisseur,produit;
   
     


BEGIN
    FOR ligne IN c1 LOOP
    CASE ligne.produit 
    
    WHEN 'A' 
    THEN 
    dbms_output.put_line(ligne.numfour  || 'fournit des produits de bon marché') ; 
    
    WHEN 'B' 
    
    THEN 
    dbms_output.put_line(ligne.numfour  || 'fournit des produits à la portée') ; 


    WHEN 'C' 

    THEN 
        dbms_output.put_line(ligne.numfour  || 'fournit des produits de luxe') ; 
    
    END; 
    
    
END ; 


/************** b ******************/

/*** genere un erreur car l 'id 745 n'existe pas 
la solution c'est gèrer l'exception ***/ 

UPDATE  produit SET typeprod = 'D'  WHERE numprod= 745 ; 
EXCEPTION 
WHEN CASE_NOT_FOUND THEN 
dbms_output_line("L'id 745 n'existe pas " ) ;  
END ; 



/************** 2 ******************/

SET SERVEROUTPUT ON
DECLARE 
couleur varchar2(20) :='&v_color'; 
design produit.desprod%type;
BEGIN
SELECT desprod INTO design FROM PRODUIT 
WHERE COULEUR=coueur;
DBMS_OUTPUT.PUT_LINE('nom produit:' || design);

EXCEPTION 

WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('pas de produit de cette color');
WHEN TOO_MANY_ROWS THEN  DBMS_OUTPUT.PUT_LINE('il existe plusieurs produit dans cette colone'); 
WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('SQLERRM');
END;
