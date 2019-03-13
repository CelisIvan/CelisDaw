<?php
    session_start();
    error_reporting(0);
    $vsesion=$_SESSION['usuario'];
    if($vsesion==null||$vsesion=''){
        echo 'NO TIENES AUTORIZACIÓN DE ENTRAR';
        die();
    }
    session_unset();
    session_destroy();
    header("Location:login.html");
?>