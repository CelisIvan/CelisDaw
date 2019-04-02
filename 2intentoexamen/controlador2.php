<?php
    require_once ("util.php");
    function incidentes(){
        $conn=conectDb();
        //SELECCIONAR TODO DE LOS LUGARES
        $salida=obtener_tipoincidentes($conn);
        return $salida;
}    
    echo incidentes();
?>