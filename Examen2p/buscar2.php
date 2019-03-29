<?php
 require_once("util.php");
 $conn= conectDb();
$salida="";
 $query="SELECT * FROM tipo_in ORDER BY id_in";
    if(isset($_POST['consulta'])){
        $q=$conn->real_escape_string($_POST['consulta']);
        $query="SELECT nombre_in FROM tipo_in
        Where nombre_in LIKE  '%" .$q. "%'  ";
    }

    $result=$conn->query($query);

    if($result->num_rows>0){

        $salida.= "<table>
        <thead>
        <tr>
        <td>Nombre incidente</td>
        </tr>
        </thead>
        <tbody>";

        while($row= $result->fetch_assoc()){
            $salida.="<tr>
                         <td>".$row['nombre_in']."</td>
                         </tr>";
                    
        }
        $salida.="<\tbody></table>";
    }
    else{
        $salida.="No existen datos que coincidan con tu búsqueda :(";

    }
    echo $salida;

    closeDb($conn);


?>