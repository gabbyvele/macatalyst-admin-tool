<?php
    session_start();
    if (!isset($_SESSION["loggedInUserId"]) || $_SESSION["loggedInUserId"] == "-1"){
        header('Location: login.php');
    }
?>