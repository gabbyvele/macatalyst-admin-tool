<?php
include('conn.php');

session_start();
$response = "false";

if (isset($_SESSION['loggedInUserId']) && $_SESSION['loggedInUserId'] != "-1") {
    //$target_dir = "../../images/";
    $target_dir = __DIR__ . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR . "images" . DIRECTORY_SEPARATOR;
    if (!file_exists($target_dir)) {
        mkdir($target_dir, 0777, true);
    }

    $postID = $_POST['postID'];
    $skipImageCheck = $_POST['skipImageCheck'];
    $postContent = $_POST['postContent'];
    $postSubject = $_POST['postSubject'];

    if (strlen($postID) > 0 && strlen($skipImageCheck) > 0 && strlen($postContent) > 0 && strlen($postSubject) > 0) {
        $sql = "UPDATE `posts` SET `POST` = '$postContent', `SUBJECT` = '$postSubject' 
			WHERE `posts`.`ID` = $postID;";

        if ($skipImageCheck == "false") {
            $fileName = $_POST['fileName'];
            $fileExtension = $_POST['fileExtension'];
            $fileName = $fileName . "_" . date("Y-m-d-H-i-s") . "." . $fileExtension;
            $location = $target_dir . $fileName;

            move_uploaded_file($_FILES["SelectedFile"]["tmp_name"], $location);

            $sql = "UPDATE `posts` SET `POST` = '$postContent', `FILE` = '$fileName', `SUBJECT` = '$postSubject' 
                WHERE `posts`.`ID` = $postID;";
        }

        if ($mysqli->query($sql) == 1) {
            echo "true";
        }
    }
}

echo $response;
?>