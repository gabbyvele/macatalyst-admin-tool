<?php

include('conn.php');

$industryID = $_POST['industryID'];
$updateType = $_POST['updateType'];

if ($updateType == "delete") {
    $sql = "DELETE FROM `industry` WHERE `industry`.`ID` = $industryID;";
    if ($mysqli->query($sql) == 1) {
        echo "true";
    } else {
        echo "false";
    }
}

?>