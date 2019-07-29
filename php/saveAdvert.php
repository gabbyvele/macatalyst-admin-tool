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

    $advertID = $_POST['advertID'];
    $advertType = $_POST['advertType'];
    $skipImageCheck = $_POST['skipImageCheck'];
    $advertStartDate = $_POST['advertStartDate'];
    $advertEndDate = $_POST['advertEndDate'];
    $advertCompany = $_POST['advertCompany'];

    if (strlen($advertID) > 0 && strlen($advertType) > 0 && strlen($advertStartDate) > 0 && strlen($advertEndDate) > 0 && strlen($advertCompany) > 0) {
        $sql = "UPDATE `adverts` SET `Advert_type` = '$advertType', `Start_Date` = '$advertStartDate', `Company` = '$advertCompany', `End_Date` = '$advertEndDate', `Last_Updated_by` = '$loggedInUserId' 
			WHERE `adverts`.`ID` = '$advertID'";

        if ($skipImageCheck == "false") {
            $fileName = $_POST['fileName'];
            $fileExtension = $_POST['fileExtension'];
            $fileName = $fileName . "_" . date("Y-m-d-H-i-s") . "." . $fileExtension;
            $location = $target_dir . $fileName;

            move_uploaded_file($_FILES["SelectedFile"]["tmp_name"], $location);

            $sql = "UPDATE `adverts` SET `Advert_type` = '$advertType', `Image` = '$fileName', `Start_Date` = '$advertStartDate', `End_Date` = '$advertEndDate', `Company` = '$advertCompany', `Last_Updated_by` = '$loggedInUserId' 
				WHERE `adverts`.`ID` = '$advertID'";
        }

        if ($mysqli->query($sql) == 1) {
            $response = "true";
        }
    }
}

echo $response;
?>