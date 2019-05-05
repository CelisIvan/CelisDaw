<?php
    session_start();
    $_SESSION['usuario']='';
    require_once("util.php");
   
    if(isset($_POST["submit"])){
        $conn=conectDb();
        $username=htmlentities($_POST['correo']);
        $pass=htmlentities($_POST['contra']);
        $query= "SELECT * FROM `usuario` WHERE Correo='$username'";
        $res=$conn->query($query);
        if($f2=mysqli_fetch_array($res,MYSQLI_BOTH)){
            if($pass==$f2['Pass']){
                    
                    $_SESSION['usuario']=$f2['Nombre'];
                    if($f2 ['id_r']== '1'){
                                    header("location:admin.php");
                            }else if($f2 ['id_r']=='2'){
                            header("location: editor.php");
                            }                    
            }else {
                header("location: login.html");
                echo '<script type="text/javascript"> alert("LOS DATOS INTRODUCIDOS SON INCORRECTOS")</script>';
            }
        }else{
            header("login.php");
        }

        }
        
    
?>