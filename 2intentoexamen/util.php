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
    function lugar(){
        $conn=conectDb();
        $salida= obtener_lugar($conn);
        return $salida;
    } 
    function imprimir_incidentes(){
        $conn= conectDb();
        $salida="";
        $result=lista_incidentes($conn);
   
       if($result->num_rows>0){
           $salida.= "<table>
                           <thead>
                           <tr>
                           <td>Hora y fecha del incidente</td>
                           <td>Lugar del Incidente</td>
                           <td>Tipo de Incidente</td>
                           </tr>
                           </thead>
                           <tbody>";
           while($row= $result->fetch_assoc()){
               $salida.="<tr>
                           <td>".$row['hora_fecha']."</td>
                           <td>".$row['nombre_lu']."</td>
                           <td>".$row['nombre_in']."</td>
                         </tr>";
           }
           $salida.="</tbody></table>";
       }
   
       echo $salida;
       
       closeDb($conn);
    }
    function incidentes(){
        $conn=conectDb();
        //SELECCIONAR TODO DE LOS LUGARES
        $salida=obtener_tipoincidentes($conn);
        return $salida;
    }
    function insertandoIncidente(){
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
    }

?>