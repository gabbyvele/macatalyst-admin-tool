<?php

include('conn.php');


$newsID = $_POST['newsID'];
$updateType = $_POST['updateType'];

if ($updateType == "delete") {
    $sql = "DELETE FROM `news` WHERE `news`.`ID` = $newsID;";
    if ($mysqli->query($sql) == 1) {
        echo "true";
    } else {
        echo "false";
    }
}

?>