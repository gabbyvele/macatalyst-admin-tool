<?php
include('conn.php');

session_start();
$response = "false";

if (isset($_SESSION['loggedInUserId']) && $_SESSION['loggedInUserId'] != "-1") {
    $loggedInUserId = $_SESSION['loggedInUserId'];
    //$target_dir = "../../images/";
    $target_dir = __DIR__ . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR . "images" . DIRECTORY_SEPARATOR;
    if (!file_exists($target_dir)) {
        mkdir($target_dir, 0777, true);
    }

    $postCompany = $_POST['postCompany'];
    $postSubject = $_POST['postSubject'];
    $fileName = $_POST['fileName'];
    $fileExtension = $_POST['fileExtension'];
    $postContent = $_POST['postContent'];

    if (strlen($postCompany) > 0 && strlen($postSubject) > 0 && strlen($fileName) > 0 && strlen($fileExtension) > 0 &&
        strlen($postContent) > 0
    ) {

        $fileName = $fileName . "_" . date("Y-m-d-H-i-s") . "." . $fileExtension;
        $location = $target_dir . $fileName;
        move_uploaded_file($_FILES["SelectedFile"]["tmp_name"], $location);

        $sql = "INSERT INTO `posts` 
            (`POST`, `FILE`, `COMPANY_ID`, `USER_ID`, `ACTIVE`, `TYPE`, `SUBJECT`, `TIMESTAMP`) VALUES
            ('$postContent', '$fileName', $postCompany, '$loggedInUserId', '1', '1', '$postSubject', CURRENT_TIMESTAMP);";


        if ($mysqli->query($sql) == 1) {
            $response = "true";
        }
    }
}

echo $response;
?>