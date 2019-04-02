<?php
    require_once ("util.php");
    $cone=conectDb();
    //INSERTAR LA TUPLA CON LOS 
    $id_lugar=$_POST['id_lugar'];
    $id_incidente=$_POST['id_incidente'];
    $result=insertarIncidente($cone,$id_lugar,$id_incidente);
    if($result){
        require_once ("controlador3.php");
        closeDb($cone);
    }else{
        echo "Hubo un error al insertar el evento";
        closeDb($cone);
    }     
?>