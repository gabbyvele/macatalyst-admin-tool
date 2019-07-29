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

    $newsHeadline = $_POST['newsHeadline'];
    $newsAuthor = $_POST['newsAuthor'];
    $newsContent = $_POST['newsContent'];
    $newsIndustry = $_POST['newsIndustry'];
    $breakingNews = $_POST['breakingNews'];
    $fileName = $_POST['fileName'];
    $fileExtension = $_POST['fileExtension'];

    if (strlen($newsHeadline) > 0 && strlen($newsAuthor) > 0 && strlen($newsContent) > 0 && strlen($newsIndustry) > 0 &&
        strlen($breakingNews) > 0 && strlen($fileName) > 0 && strlen($fileExtension) > 0) {

        $breakingNewsVal = 0;
        if ($breakingNews == "true") {
            $breakingNewsVal = 1;
        }

        $fileName = $fileName . "_" . date("Y-m-d-H-i-s") . "." . $fileExtension;
        $location = $target_dir . $fileName;
        move_uploaded_file($_FILES["SelectedFile"]["tmp_name"], $location);

        $sql = "INSERT INTO `news`(`Headline`, `Author`, `Content`, `Date`, `Image`, `Industry`, `Breaking_news`, `Views`, `user_id`) VALUES 
            ('$newsHeadline', '$newsAuthor', '$newsContent', CURRENT_TIMESTAMP, '$fileName', '$newsIndustry', '$breakingNewsVal', '0', '$loggedInUserId');";


        if ($mysqli->query($sql) == 1) {
            echo "true";
        }
    }
}

echo $response;
?>