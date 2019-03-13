<?php
function conectBb(){
    $servername="localhost";
    $username="root";
    $password="";
    $dbname="cubi13";

    $con=mysqli_connect($servername, $username, $password, $dbname);

    //check connection
    if (!$con){
        die("Connection failed: " . mysql_connect_error());
    }

    return $con;
}

function closeDb($mysql){
    mysqli_close($mysql);
} 
function getAlumnos(){
    $conn=conectDb();
    $sql="SELECT nombre, apellido_paterno,apellido_materno,Sexo,comentarios,peso FROM alumno"
    $result= mysqli_query($conn,$sql);
    closeDb($conn);
    return $result;
}

// function add_usuario($nombre, $paterno, $materno, $sexo,$comentario,$peso,$vis) {
//     $bd = connectBd();
    
//     // insert command specification 
//     $query='INSERT INTO usuarios (nombre, apellido_paterno, apellido_materno, Sexo, comentarios, peso, visible) VALUES (?,?,?,?,?,?,?)';
//     // Preparing the statement 
//     if (!($statement = $bd->prepare($query))) {
//         die("Preparation failed: (" . $bd->errno . ") " . $bd->error);
//     }
    
//     $nombre = $bd->real_escape_string($nombre);
//     $paterno = $bd->real_escape_string($paterno);
//     $materno = $bd->real_escape_string($materno);
//     $sexo = $bd->real_escape_string($sexo);
//     $comentario = $bd->real_escape_string($comentario);
//     $peso = $bd->real_escape_string($peso);
//     $vis = $bd->real_escape_string($vis);
    
//     if (!$statement->bind_param("ssss", $nombre, $paterno, $materno, $sexo,$comentario,$peso,$vis)) {
//         die("Parameter vinculation failed: (" . $statement->errno . ") " . $statement->error); 
//     }
//      // Executing the statement
//      if (!$statement->execute()) {
//         die("Execution failed: (" . $statement->errno . ") " . $statement->error);
//       } 

//     close($bd);
// }
?>