<?php

function conectDb(){
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "jurassic park"; 
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
?>