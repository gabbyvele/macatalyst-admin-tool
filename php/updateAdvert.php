<?php
include('conn.php');

session_start();
$response = "false";

if (isset($_SESSION['loggedInUserId']) && $_SESSION['loggedInUserId'] != "-1") {
    $advertID = $_POST['advertID'];
    $updateType = $_POST['updateType'];

    if ($updateType == "enable") {
        $sql = "UPDATE `adverts` SET `Active` = '1' WHERE `adverts`.`ID` = $advertID;";
        if ($mysqli->query($sql) == 1) {
            $response = "true";
        }
    }

    if ($updateType == "disable") {
        $sql = "UPDATE `adverts` SET `Active` = '0' WHERE `adverts`.`ID` = $advertID;";
        if ($mysqli->query($sql) == 1) {
            $response = "true";
        }
    }

    if ($updateType == "delete") {
        $sql = "DELETE FROM `adverts` WHERE `adverts`.`ID` = $advertID;";
        if ($mysqli->query($sql) == 1) {
            $response = "true";
        }
    }
}

echo $response;
?>
