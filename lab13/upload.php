<?php
$target_dir = "archivos/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
// Check if image file is a actual image or fake image
if(isset($_POST["submit"])) {
    $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
    if($check !== false) {
        echo "El archivo es una imagen - " . $check["mime"] . ".";
        echo "<br>";
        $uploadOk = 1;
    } else {
        echo "El archivo no es una imagen";
        echo "<br>";
        $uploadOk = 0;
    }
}
// Check if file already exists
if (file_exists($target_file)) {
    echo "El archivo no existe";
    echo "<br>";
    $uploadOk = 0;
}
// Check file size
if ($_FILES["fileToUpload"]["size"] > 500000) {
    echo "El archivo es muy grande";
    echo "<br>";
    $uploadOk = 0;
}
// Allow certain file formats
if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
&& $imageFileType != "gif" ) {
    echo "Solo se permiten archivos png,jpg,jpeg o gif";
    echo "<br>";
    $uploadOk = 0;
}
// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
    echo "El archivo no fue subido";
    echo "<br>";
// if everything is ok, try to upload file
} else {
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {

        echo "El archivo ". basename( $_FILES["fileToUpload"]["name"]). " se ha subido a la carpeta 'archivos'";
        echo "<br>";
        
    } else {
        echo "Hubo un problema subiendo el archivo";
    }
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
  <!-- Bootstrap core CSS -->
  <link href="BOOTSTRAP/css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="BOOTSTRAP/css/mdb.min.css" rel="stylesheet">
  <!-- Your custom styles (optional) -->
  <link href="BOOTSTRAP/css/style.css" rel="stylesheet">
  <link href="loginstyle.css" rel="stylesheet">
    <title>Subir</title>
</head>

<body>
    <br>
    <hr>

  <div class="container">
      <p>
      ¿Por qué es importante hacer un session_unset() y luego un session_destroy()?<br>
      Porque tenemos que liberar todas las variables de sesion para no seguir oocupando memoria<br>
¿Cuál es la diferencia entre una variable de sesión y una cookie?<br>
La session es eso, pero la cooki es más bien un archivo que se guarda en tu computadora para que la pagina a la que accedes pueda correr mejor<br>
¿Qué técnicas se utilizan en sitios como facebook para que el usuario no sobreescriba sus fotos en el sistema de archivos cuando sube una foto con el mismo nombre?<br>
Les asigna nombres diferentes a las fotos, son muy largos que se generan con un algoritmo que seguramente varia dependiendo del servidor al que se sube y la región, así como el usuario y la hora
¿Qué es CSRF y cómo puede prevenirse?<br>
La técnica llamada falsificación de petición en sitios cruzados, proviene de su nombre en inglés Cross Site Request Forgery (CSRF o XSRF). Este ataque fuerza al 
navegador web de su víctima, validado en algún servicio (como por ejemplo correo o home banking) a enviar una petición a una aplicación web vulnerable.<br>
Se recomienda siempre cerrar sesion, no recordar contraseñas o incluso hacer uso de complementos que bloqueen la ejecución de scripts<br><br>
</p>
  <a href="logout.php"> Cerrar sesion</a>
</div>
</div>
  <script type="text/javascript" src="loginjs.js"></script>
  <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="js/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="js/mdb.js"></script>
</body>

</html>