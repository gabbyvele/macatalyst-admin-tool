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

    $newsID = $_POST['newsID'];
    $skipImageCheck = $_POST['skipImageCheck'];
    $newsHeadline = $_POST['newsHeadline'];
    $newsAuthor = $_POST['newsAuthor'];
    $newsContent = $_POST['newsContent'];
    $newsIndustry = $_POST['newsIndustry'];
    $breakingNews = $_POST['breakingNews'];

    if (strlen($newsID) > 0 && strlen($skipImageCheck) > 0 && strlen($newsHeadline) > 0 && strlen($newsAuthor) > 0 &&
        strlen($newsContent) > 0 && strlen($newsIndustry) > 0 && strlen($breakingNews) > 0
    ) {

        $breakingNewsVal = 0;
        if ($breakingNews == "true") {
            $breakingNewsVal = 1;
        }

        $sql = "UPDATE `news` SET `Headline` = '$newsHeadline', `Author` = '$newsAuthor', `Content` = '$newsContent', 
            `Industry` = '$newsIndustry', `Breaking_news` = '$breakingNewsVal' WHERE `news`.`ID` = $newsID;";

        if ($skipImageCheck == "false") {
            $fileName = $_POST['fileName'];
            $fileExtension = $_POST['fileExtension'];
            $fileName = $fileName . "_" . date("Y-m-d-H-i-s") . "." . $fileExtension;
            $location = $target_dir . $fileName;

            move_uploaded_file($_FILES["SelectedFile"]["tmp_name"], $location);

            $sql = "UPDATE `news` SET `Headline` = '$newsHeadline', `Author` = '$newsAuthor', `Content` = '$newsContent', 
                `Image` = '$fileName', `Industry` = '$newsIndustry', `Breaking_news` = '$breakingNewsVal' WHERE `news`.`ID` = $newsID;";
        }

        if ($mysqli->query($sql) == 1) {
            $response = "true";
        }
    }
}

echo $response;
?>