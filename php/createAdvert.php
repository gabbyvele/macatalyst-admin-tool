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

    $advertType = $_POST['advertType'];
    $fileName = $_POST['fileName'];
    $fileExtension = $_POST['fileExtension'];
    $advertStartDate = $_POST['advertStartDate'];
    $advertEndDate = $_POST['advertEndDate'];
    $advertCompany = $_POST['advertCompany'];

    if (strlen($advertType) > 0 && strlen($fileName) > 0 && strlen($fileExtension) > 0 && strlen($advertStartDate) > 0 && strlen($advertEndDate) > 0 && strlen($advertCompany) > 0) {

        $fileName = $fileName . "_" . date("Y-m-d-H-i-s") . "." . $fileExtension;
        $location = $target_dir . $fileName;
        if (move_uploaded_file($_FILES["SelectedFile"]["tmp_name"], $location)) {

            $sql = "INSERT INTO `adverts` 
            (`Advert_type`, `Active`, `Image`, `Start_Date`, `End_Date`, `Company`, `Created_by`, `Last_Updated_by`) VALUES 
            ('$advertType', '1', '$fileName', '$advertStartDate', '$advertEndDate', '$advertCompany', '$loggedInUserId', '$loggedInUserId');";

            if ($mysqli->query($sql) == 1) {
                $response = "true";
            }
        }
    }
}

echo $response;
?>