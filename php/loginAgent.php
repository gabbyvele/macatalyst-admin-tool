<?php

include('conn.php');
session_start();
$emailAddress = $_POST['emailAddress'];
$password = $_POST['password'];
$response = "false";

if (strlen($emailAddress) > 0 && strlen($password) > 0) {
    $password = md5($password);
    $sql = "SELECT `ID` FROM `users` WHERE `EMAIL` = '$emailAddress'";
    $res = $mysqli->query($sql);

    if ($login = $res->fetch_assoc()) {
        $response = "1";
        $sql = "SELECT * FROM `users` WHERE `PASSWORD` = '$password' AND `EMAIL` = '$emailAddress'";
        $res1 = $mysqli->query($sql);

        if ($user = $res1->fetch_assoc()) {
            if ($user['ACTIVE'] == 1 && intval($user['LOGIN_RETRIES']) < 4) {
                $response = "true";
                $_SESSION["loggedInUserId"] = $user['ID'];
            }
        } else {
            $sql = "UPDATE `users` SET `LOGIN_RETRIES` = `LOGIN_RETRIES` +1 WHERE `users`.`EMAIL` = '$emailAddress';";
            $mysqli->query($sql);
        }
    }
}

echo $response;
?>