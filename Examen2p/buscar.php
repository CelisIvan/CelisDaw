<?php
 require_once("util.php");
 $conn= conectDb();
$salida="";
 $query="SELECT * FROM lugares ORDER BY id_lugar";
    if(isset($_POST['consulta'])){
        $q=$conn->real_escape_string($_POST['consulta']);
        $query="SELECT nombre_lu FROM lugares
        Where nombre_lu LIKE  '%" .$q. "%'  ";
    }

    $result=$conn->query($query);

    if($result->num_rows>0){

        $salida.= "<table>
        <thead>
        <tr>
        <td>Nombre Lugar</td>
        </tr>
        </thead>
        <tbody>";

        while($row= $result->fetch_assoc()){
            $salida.="<tr>
                         <td>".$row['nombre_lu']."</td>
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