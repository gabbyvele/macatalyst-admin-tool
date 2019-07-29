<?php
session_start();
if (isset($_SESSION["loggedInUserId"]) && $_SESSION["loggedInUserId"] != "-1") {
    header('Location: index.php');
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>MAC - Login</title>
    <!-- Bootstrap core CSS-->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">
</head>

<body class="bg-dark">
<div class="container">
    <div class="card card-login mx-auto mt-5">
        <div class="card-header">Login - MAT</div>
        <div class="card-body">
            <form>
                <div class="form-group">
                    <label for="email-address">Email address</label>
                    <input class="form-control" id="email-address" type="email" aria-describedby="emailHelp"
                           placeholder="Enter email">
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input class="form-control" id="password" type="password" placeholder="Password">
                </div>
                <div class="form-group" style="text-align: center">
                    <a class="align-items-center" data-toggle="modal" data-target="#alert-modal">
                        <button type="button" class="btn btn-success" id="login" style="width: 100%">
                            Login
                        </button>
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="modal fade" id="alert-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">
                    <div id="alert-heading"></div>
                </h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <div id="alert-messages"></div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>
<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/popper/popper.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="js/scripting.js"></script>
</body>

</html>
