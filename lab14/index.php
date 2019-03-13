<?php
    require_once "model.php";
    $result=getAlumnos();
    if(mysqli_num_rows($result)>0){
        while($row=mysqli_fetch_assoc($result)){
            echo "<tr>"
            echo "<td>".row["nombre"]."</td>";
            echo "<td>".row["apellido_paterno"]."</td>";
            echo "<td>".row["apellido_materno"]."</td>";
            echo "<td>".row["Sexo"]."</td>";
            echo "<td>".row["comentarios"]."</td>";
            echo "<td>".row["peso"]."</td>";
        }
    }
?>