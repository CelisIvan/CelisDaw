<?php
    require_once ("util.php");
    function incidentes(){
        $conn=conectDb();
        
        //SELECCIONAR TODO DE LOS LUGARES
        $query="SELECT * FROM tipo_in ORDER BY nombre_in ASC";
        $result=$conn->query($query);
        $salida='<option value="0">Elige el tipo de incidente</option>';
        //PARA PODER GUARDAR SE OCUPA UN VALOR QUE EN ESTE CASO SERÍA EL ID DEL INCIDENTE
        while($row=  mysqli_fetch_array($result,MYSQLI_BOTH)){
           $salida.="<option value='$row[id_tipo]'>$row[nombre_in]</option>";
        }
        return $salida;
}    
    echo incidentes();

?>