<?php

include('conn.php');
session_start();
$response = "false";

if (isset($_SESSION['loggedInUserId']) && $_SESSION['loggedInUserId'] != "-1") {
    $loggedInUserId = $_SESSION['loggedInUserId'];

    $industryName = $_POST['industryName'];
    $industryDescription = $_POST['industryDescription'];

    if (strlen($industryName) > 0 && strlen($industryDescription) > 0) {

        $sql = "INSERT INTO `industry` 
            (`name`, `description`) VALUES 
            ('$industryName', '$industryDescription');";

        if ($mysqli->query($sql) == 1) {
            $response = "true";
        }
    }
}

echo $response;
?>