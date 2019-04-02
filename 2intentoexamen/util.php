<?php

function conectDb(){
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "jurassic park"; 
    $con = mysqli_connect($servername, $username, $password, $dbname);
    $con->set_charset('utf8');
    //Check connection
    if(!$con){
        //die("Connection failed: ".mysqli_connect_error());
        die("Error 505: Internal Sever Error");
    }
    return $con;
}
    function obtener_lugar($conn){

        $query="SELECT * FROM lugares ORDER BY nombre_lu ASC";
        $result=$conn->query($query);
        $salida='<option value="0">Elige el lugar del incidente</option>';
        
        //PARA PODER GUARDAR SE OCUPA UN VALOR QUE EN ESTE CASO SERÍA EL ID DEL INCIDENTE
        while($row=  mysqli_fetch_array($result,MYSQLI_BOTH)){
           $salida.="<option value='$row[id_lugar]'> $row[nombre_lu]</option>";
        }
        return $salida;
    }
    function insertarIncidente($conne,$id_lugar,$id_incidente){
        $query="INSERT INTO incidentes (lugar, tipo) values ($id_lugar, $id_incidente)";
        $result=$conne->query($query);

        return $result;

    }
    function obtener_tipoincidentes($conne){
        
        $query="SELECT * FROM tipo_in ORDER BY nombre_in ASC";
        $result=$conne->query($query);
        $salida='<option value="0">Elige el tipo de incidente</option>';
        //PARA PODER GUARDAR SE OCUPA UN VALOR QUE EN ESTE CASO SERÍA EL ID DEL INCIDENTE
        while($row=  mysqli_fetch_array($result,MYSQLI_BOTH)){
           $salida.="<option value='$row[id_tipo]'>$row[nombre_in]</option>";
        }


        return  $salida;
    }
    function lista_incidentes ($conn){
        $query="CALL getIncidentes()";
   
       $result=$conn->query($query);
       return $result;
    }
//cierra la conexión con la base de datos
        function closeDb($mysql){
            mysqli_close($mysql);
    }

?>