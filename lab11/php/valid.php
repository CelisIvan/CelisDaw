<?php
  if(isset($_POST['submit'])){
      if(empty($nombre)){
          echo "<p class='malo'>*Es necesario que escribas tu nombre </p>";
      }else{
          if(strlen($nombre)>30)
          echo "<p class='malo'>* El nombre es muy largo </p>";
      }
      if(empty($apellidos)){
        echo "<p class='malo'>* Es necesario que escribas tus apellidos </p>";}
        else{
            if(strlen($apellidos)>65)
          echo "<p class='malo'>* Los apellidos son muy largo </p>";
          if(is_numeric($apellidos))
            echo "<p class='malo' Los apellidos no pueden ser números> </p>";
        }
    
    if(empty($contra)){
        echo "<p class='malo'>*Es necesario que escribas tu contraseña </p>";
    }
    if(empty($mail)){
        echo "<p class='malo'>*Es necesario que escribas tu e-mail </p>";}
        else{
            if(!filter_var($mail,FILTER_VALIDATE_EMAIL)){
                echo "<p class='malo'> * El correo debe de ser una dirección valida. </p>";
            }
        }
    
    if(empty($nick)){
        echo "<p class='malo'>*Es necesario que escribas tu nickname</p>";
    }
    
  }
?>
