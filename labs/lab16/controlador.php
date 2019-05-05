<?php
    require_once ("util.php");
    $conn=conectDb();
        $nombre= htmlentities($_POST['nombre']);
        $apellidos= htmlentities($_POST['apellido']);
        $email=htmlentities($_POST['email']);
        $username=htmlentities($_POST['username']);
        if(htmlentities($_POST['contra'])==htmlentities($_POST['contraconfirm']))
        $contra= password_hash($_POST['contra'],PASSWORD_BCRYPT);
        
     guardarUsuario($conn,$nombre,$apellidos,$email,$username,$contra);

    
?>