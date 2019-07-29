<?php

include('conn.php');

session_start();
$response = "false";

if (isset($_SESSION['loggedInUserId']) && $_SESSION['loggedInUserId'] != "-1") {
    $industryID = $_POST['industryID'];
    $industryName = $_POST['industryName'];
    $industryDescription = $_POST['industryDescription'];

    if (strlen($industryID) > 0 && strlen($industryName) > 0 && strlen($industryDescription) > 0) {

        $sql = "UPDATE `industry` SET `name` = '$industryName', `description` = '$industryDescription'
            WHERE `industry`.`id` = $industryID;";

        if ($mysqli->query($sql) == 1) {
            $response = "true";
        }
    }
}

echo $response;
?>