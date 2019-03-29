<?php

require_once ("util.php");


$fecha=array();
$lugar=array();
$tipo=array();


$result= 'CALL getEventos()';

if(mysqli_num_rows($result)>0){
    while($row=mysqli_fetch_assoc($result)){
      array_push($fecha,$row["hora_fecha"]); // guarda los nombres de todos los eventos en un array
      array_push($lugar,$row["lugar"]);
      array_push($tipo,$row["tipo"]);
    }
}

$size=0;

for($i=0; $i<count($nombres); $i++)
{
   
    $size++;
    $fechas=$fecha[$i];
    $lugares=$lugar[$i];
    $tipos=$tipo[$i];
    $response.= '<tr>
                    <td>'.$fechas.'</td>
                    <td>'. $lugares.'</td>
                    <td>'.$tipos.'</td>
                </tr>';
   
  
}

if($size>0){
    echo  '<div class="responsive-table table-status-sheet"> 
                <table class="my_table2">
                <tr>
                    <th>Fecha</th> 
                    <th>Lugar</th> 
                    <th>Tipo</th> 
                    </tr>'.$response.'</table> </div>';
}


?>