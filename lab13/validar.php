<?php
  session_start();
if (isset($_POST["nombre"]) && !empty($_POST["nombre"])) {
    $nombre = $_POST['nombre'];  
}
else{
    $nombre='';
}

$_SESSION['usuario']=$nombre;
header("Location:nuevo.php");
    
?>