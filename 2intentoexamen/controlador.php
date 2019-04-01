<?php
    require_once ("util.php");
    function lugar(){
        $conn=conectDb();
        
        
        $query="SELECT * FROM lugares ORDER BY nombre_lu ASC";
        $result=$conn->query($query);
        $salida='<option value="0">Elige el lugar del incidente</option>';
        
        //PARA PODER GUARDAR SE OCUPA UN VALOR QUE EN ESTE CASO SERÍA EL ID DEL INCIDENTE
        while($row=  mysqli_fetch_array($result,MYSQLI_BOTH)){
           $salida.="<option value='$row[id_lugar]'> $row[nombre_lu]</option>";
        }
        return $salida;
}    
    echo lugar();

?>