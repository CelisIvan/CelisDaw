<?php

    require_once("util.php");
    $conn= conectDb();
   $salida="";
        $result=lista_incidentes($conn);
   
       if($result->num_rows>0){
           $salida.= "<table>
                           <thead>
                           <tr>
                           <td>Hora y fecha del incidente</td>
                           <td>Lugar del Incidente</td>
                           <td>Tipo de Incidente</td>
                           </tr>
                           </thead>
                           <tbody>";
           while($row= $result->fetch_assoc()){
               $salida.="<tr>
                           <td>".$row['hora_fecha']."</td>
                           <td>".$row['nombre_lu']."</td>
                           <td>".$row['nombre_in']."</td>
                         </tr>";
           }
           $salida.="</tbody></table>";
       }
   
       echo $salida;
   
       closeDb($conn);
 


?>