<?php
    require_once ("util.php");
    function lugar(){
        $conn=conectDb();
        $salida= obtener_lugar($conn);
        return $salida;
}   echo lugar();
?>