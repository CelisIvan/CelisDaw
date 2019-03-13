<?php
    session_start();
    
    error_reporting(0);
    $vsesion=$_SESSION['usuario'];
    if($vsesion==null||$vsesion=''){
        echo 'NO TIENES AUTORIZACIÓN DE ENTRAR';
        die();
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
  <!-- SCRIPTS -->
  <!-- JQuery -->

    <div class="container">
    <h2>Bienvenido: <?php echo $_SESSION['usuario'];?></h2>
    <div clas="container">
    <form action="upload.php" method="post" enctype="multipart/form-data">
    Seleccionar imagen a subir
    <input type="file" name="fileToUpload" id="fileToUpload" accept="image/*">
    <br>
    <input type="submit" value="Subir imagen" name="submit">
</form>
</div>

  <a href="logout.php"> Cerrar sesion</a>
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