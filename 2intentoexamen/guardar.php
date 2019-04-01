<?php
    require_once ("util.php");
    $cone=conectDb();
    if(isset($_POST["guardar"])){
        //JALAR LOS VALUES DE MIS SELECTS PARA PODER INSERTARLOS EN LA BASE DE DATOS
         $id_lugar=htmlentities($_POST['selectlugar']);
    $id_incidente=htmlentities($_POST['selectincidente']);
    //INSERTAR LA TUPLA CON LOS 
    $query="INSERT INTO incidentes (lugar, tipo) values ('$id_lugar', '$id_incidente')";
    $result=$cone->query($query);
    if($result){
        echo "Incidente guardado correctamente";
        closeDb($cone);
        //echo '<input type="button" value="Regresar" onclick="location.href=http://localhost/2intentoexamen/index.php"/>';
        
    }else{
        
        echo "Hubo un error al insertar el evento";
        closeDb($cone);
        //echo '<br><button type="button" onclick="location="index.php"">REGRESAR</button>';
    }
    }
    
    
    
?>