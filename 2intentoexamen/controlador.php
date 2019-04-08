<?php
    require ("util.php");
    $funcion=$_POST['funcion'];

    switch ($funcion){
        case 1:
            echo lugar();   
            break;
        case 2:
            echo incidentes();
            break;
        case 3:
            echo imprimir_incidentes();
            break;
        case 4:
            insertandoIncidente();
            break;
    }
    
?>