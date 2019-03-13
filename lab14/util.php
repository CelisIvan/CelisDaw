<?php
function conectDb(){
    $servername="localhost";
    $username="root";
    $password="";
    $dbname="cubi13";

    $conn=mysqli_connect($servername, $username, $password, $dbname);

    //check connection
    if (!$conn){
        die("Connection failed: " . mysql_connect_error());
    }
    $conn->set_charset(" ");
    return $conn;
}

function closeDb($con){
    mysqli_close($con);
} 
?>