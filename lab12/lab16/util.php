<?php
function conectDb(){
    $servername="10.25.18.106,10433";
    $username="a1703860";
    $password="qenufewe";
    $dbname="a1703860";

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