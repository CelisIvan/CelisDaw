<?php

function conectDb(){
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "labsdaw"; 
    $con = mysqli_connect($servername, $username, $password, $dbname);
    //Check connection
    if(!$con){
        //die("Connection failed: ".mysqli_connect_error());
        die("Error 505: Internal Sever Error");
    }
    return $con;
}

//cierra la conexión con la base de datos
        function closeDb($mysql){
            mysqli_close($mysql);
    }
    function consultaUsuarios(){
        $conn=conectDb();
        $query="SELECT Nombre,Apellidos,Correo,Username from usuario";
        $salida="";
        $result=$conn->query($query);
        $salida.="<table class='table table-striped'>
                         <thead class='black white-text'>
                        <tr>
                        <td>Nombre</td>
                        <td>Apellidos</td>
                        <td>Correo</td>
                        <td>Username</td>
                        </tr>
                        </thead>
                        <tbody>";
        while($row=$result->fetch_assoc()){
            $salida.="<tr>
                        <td>".$row['Nombre']."</td>
                        <td>".$row['Apellidos']."</td>
                        <td>".$row['Correo']."</td>
                        <td>".$row['Username']."</td>                       
                    </tr>";
        }
        $salida.="</tbody></table>";  
        return $salida;
        closeDb($conn);
    }

    //Funcion de insertar Incidente
    function guardarUsuario($conn,$nombre,$apellidos,$correo,$username,$contra){
        
        $query="INSERT INTO usuario (Nombre,Apellidos,Correo,Username,Pass) VALUES ($nombre,$apellidos,$email,$username,$contra)";
        $result=$conn->query($query);
        if($result){
            echo "Usuario insertado correctamente<br><br>";
            echo consultaUsuarios();
        }else{
            echo "PROBLEMAS AL REGISTRAR EL USUARIO";
        }

    }
?>