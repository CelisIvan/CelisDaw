<?php
 require_once("util.php");
 $conn= conectDb();
$salida="";
 $query="SELECT * FROM amigos ORDER BY cod_amigo";
    if(isset($_POST['consulta'])){
        $q=$conn->real_escape_string($_POST['consulta']);
        $query="SELECT cod_amigo, Nombre, Carrera, Estado FROM amigos 
        Where Nombre LIKE  '%" .$q. "%' OR Carrera LIKE '%" .$q. "%' OR
        Estado LIKE '%" .$q. "%' ";
    }

    $result=$conn->query($query);

    if($result->num_rows>0){
        $salida.= "<table>
                        <thead>
                        <tr>
                        <td>cod_amigo</td>
                        <td>Nombre</td>
                        <td>Carrera</td>
                        <td>Estado</td>
                        </tr>
                        </thead>
                        <tbody>";
        while($row= $result->fetch_assoc()){
            $salida.="<tr>
                        <td>".$row['cod_amigo']."</td>
                        <td>".$row['Nombre']."</td>
                        <td>".$row['Carrera']."</td>
                        <td>".$row['Estado']."</td>
                      </tr>";
        }
        $salida.="</tbody></table>";
    }
    else{
        $salida.="No existen datos que coincidan con tu búsqueda :(";

    }
    echo $salida;

    closeDb($conn);


?>