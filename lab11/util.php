<?php

function inicio($titulo="Registrarse") {
   include("_header.html");
}

function info($mensaje) {
   $mensaje = '<div class="alert alert-primary" role="alert">'.$mensaje.'</div>';
   echo $mensaje;
}
?>