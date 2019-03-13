<?php
require_once "util.php";

function getAlumnos(){
    $conn=conectDb();
    echo '<div><h1>ALUMNOS</h1> </div>';
    echo '<div class="row"><div class="col m12 medium-table"><table class="centered"><thead>';
    echo '<tr><th>ID</th><th>Nombre(s)</th><th>Apellido Paterno(s)</th><th>Apellido Materno(s)</th><th>Sexo</th><th>Comentarios</th><th>Peso</th><th>Visible</th></tr></thead><tbody>';
$query= "SELECT * FROM alumno";
    $res = $conn->query($query);
    while ($row = mysqli_fetch_array($res,MYSQLI_BOTH)) {
        echo '<tr>';
        echo '<td>'.$row['id_alumno'].'</td>';
        echo '<td>'.$row['nombre'].'</td>';
        echo '<td>'.$row['apellido_paterno'].'</td>';
        echo '<td>'.$row['apellido_materno'].'</td>';
        echo '<td>'.$row['Sexo'].'</td>';
        echo '<td>'.$row['comentarios'].'</td>';
        echo '<td>'.$row['peso'].'</td>';
        echo '<td>'.$row['visible'].'</td>';
        echo '</tr>';
    }
    echo '</tbody></table></div></div>';
  mysqli_free_result($res);
  echo '<br><br><hr>';
    closeDb($conn);
}
function getLigeros(){
    $conn=conectDb();
    echo '<div><h1>ALUMNOS QUE PESAN MENOS DE 70KG</h1> </div>';
    echo '<div class="row"><div class="col m12 medium-table"><table class="centered"><thead>';
    echo '<tr><th>ID</th><th>Nombre(s)</th><th>Peso</th></tr></thead><tbody>';
    $sql="SELECT  id_alumno,nombre,peso FROM alumno WHERE peso <=70";
    $res = $conn->query($sql);
    while ($row = mysqli_fetch_assoc($res)) {
        echo '<tr>';
        // use of numeric index
        echo '<td>'.$row['id_alumno'].'</td>';
        echo '<td>'.$row['nombre'].'</td>';
        echo '<td>'.$row['peso'].'</td>';
        echo '</tr>';
    }
    echo '</tbody></table></div></div>';
  mysqli_free_result($res);
  
  echo '<br><br><hr>';
    closeDb($conn);
}
function getPesados(){
  echo '<div><h1>ALUMNOS QUE PESAN MÁS DE 70KG</h1> </div>';
    echo '<div class="row"><div class="col m12 medium-table"><table class="centered"><thead>';
    echo '<tr><th>ID</th><th>Nombre(s)</th><th>Peso</th></tr></thead><tbody>';  
  $conn=conectDb();
    $sql='SELECT id_alumno,nombre , peso FROM alumno WHERE peso > 70';
    $res = mysqli_query($conn,$sql);
    while ($row = mysqli_fetch_assoc($res)) {
        echo '<tr>';
        echo '<td>'.$row['id_alumno'].'</td>';
        echo '<td>'.$row['nombre'].'</td>';
        echo '<td>'.$row['peso'].'</td>';
        echo '</tr>';
    }
    echo '</tbody></table></div></div>';
  mysqli_free_result($res);

    echo '<br><br><hr>';
    closeDb($conn);
}


?>