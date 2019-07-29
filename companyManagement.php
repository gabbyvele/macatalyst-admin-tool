<?php
include('php/sessionFactory.php');
include('php/serverCache.php');
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>MAC - Company Mgmt</title>
    <!-- Bootstrap core CSS-->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="index.php">Macatalysts - Admin Tool</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
            data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
            aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
                <a class="nav-link" href="index.php">
                    <i class="fa fa-fw fa-dashboard"></i>
                    <span class="nav-link-text">Dashboard</span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Adverts">
                <a class="nav-link" href="adverts.php">
                    <i class="fa fa-fw fa-archive"></i>
                    <span class="nav-link-text">Adverts</span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Advert Management">
                <a class="nav-link" href="advertManagement.php">
                    <i class="fa fa-fw fa-picture-o"></i>
                    <span class="nav-link-text">Advert Management</span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Posts">
                <a class="nav-link" href="companies.php">
                    <i class="fa fa-fw fa-address-book"></i>
                    <span class="nav-link-text">Companies</span>
                </a>
            </li>
            <li class="nav-item active" data-toggle="tooltip" data-placement="right" title="Posts">
                <a class="nav-link" href="companyManagement.php">
                    <i class="fa fa-fw fa-address-card"></i>
                    <span class="nav-link-text">Company Management</span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Posts">
                <a class="nav-link" href="news.php">
                    <i class="fa fa-fw fa-newspaper-o"></i>
                    <span class="nav-link-text">News</span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Posts">
                <a class="nav-link" href="newsManagement.php">
                    <i class="fa fa-fw fa-map"></i>
                    <span class="nav-link-text">News Management</span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Posts">
                <a class="nav-link" href="posts.php">
                    <i class="fa fa-fw fa-gears"></i>
                    <span class="nav-link-text">Posts</span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Posts">
                <a class="nav-link" href="postManagement.php">
                    <i class="fa fa-fw fa-gear"></i>
                    <span class="nav-link-text">Post Management</span>
                </a>
            </li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right">&nbsp;</li>
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Meta Data">
                <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMulti" data-parent="#exampleAccordion">
                    <i class="fa fa-fw fa-sitemap"></i>
                    <span class="nav-link-text">Meta Data</span>
                </a>
                <ul class="sidenav-second-level collapse" id="collapseMulti">
                    <li>
                        <a href="industries.php">Industries</a>
                    </li>
                    <li>
                        <a href="industryManagement.php">Industry Management</a>
                    </li>
                </ul>
            </li>
        </ul>
        <ul class="navbar-nav sidenav-toggler">
            <li class="nav-item">
                <a class="nav-link text-center" id="sidenavToggler">
                    <i class="fa fa-fw fa-angle-left"></i>
                </a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
                    <i class="fa fa-fw fa-sign-out"></i>Logout</a>
            </li>
        </ul>
    </div>
</nav>
<div class="content-wrapper">
    <div class="container-fluid">
        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="index.php">Dashboard</a>
            </li>
            <li class="breadcrumb-item active">Company Management</li>
        </ol>
        <div class="row">
            <div class="col-12">
                <?php
                $companyID = -1;
                if (isset($_GET['company-id'])) {
                    $companyID = preg_replace("#[^0-9]#", "", $_GET["company-id"]);
                }

                if ($companyID != -1 && $companyID != "") {
                    $sqliQuery = $selectCompanyQuery . $companyID;
                    $res = $mysqli->query($sqliQuery);

                    if ($post = $res->fetch_assoc()) {

                        echo "
                        <h1>Edit Company</h1>
                        <div class=\"container-fluid content\">
                            Name: <input type=\"text\" placeholder=\"Name\" class=\"form-control\" id=\"company-name\">
                            Logo:
                            <div class='input-group'>
                                <label class=\"btn btn-primary btn-sm\" for=\"company-logo\">
                                    <input id=\"company-logo\" type=\"file\" style=\"display:none\"
                                           onchange=\"$('#upload-file-info').html(this.files[0].name);
                                                         previewFile();\">
                                    Upload
                                </label>
                                <div>
                                    <span class='label label-info' id=\"upload-file-info\" style='padding: 10px'></span>
                                </div>
                            </div>
                            <div>
                                <img src=\"\" height=\"100\" alt=\"Logo preview...\">
                            </div>
                            Summary:
                            <textarea class=\"form-control\" style=\"min-width: 100%; min-height: 100px;\"
                                      id=\"company-summary\"></textarea>
                            Phone: <input type=\"text\" placeholder=\"Phone\" class=\"form-control\" id=\"company-phone\">
                            Email: <input type=\"email\" placeholder=\"Email\" class=\"form-control\" id=\"company-email\">
                            Website: <input type=\"url\" placeholder=\"Website\" class=\"form-control\" id=\"company-website\">
                            Address:
                            <textarea class=\"form-control\" style=\"min-width: 100%; min-height: 100px;\"
                                      id=\"company-address\"></textarea>
                            <div style='padding-bottom: 5px; padding-top: 5px;'>
                                <a data-toggle=\"modal\" data-target=\"#alert-modal\">
                                    <button type=\"button\" class=\"btn btn-success\" id=\"save-company\">Save</button>
                                </a>
                            </div>
                        </div>";
                    } else {
                        echo $createCompanyForm;
                    }
                } else {
                    echo $createCompanyForm;
                }
                ?>
            </div>
        </div>
    </div>
</div>
<!-- /.container-fluid-->
<!-- /.content-wrapper-->
<footer class="sticky-footer">
    <div class="container">
        <div class="text-center">
            <small>© 2017 Macatalysts | Privacy | Powered by <a href="https://myitzar.co.za/">MyITZAR</a></small>
        </div>
    </div>
</footer>
<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fa fa-angle-up"></i>
</a>
<!-- Logout Modal-->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <button class="btn btn-primary" type="button" id="logout" data-dismiss="modal">Logout</button>
            </div>
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
<!-- Custom scripts for all pages-->
<script src="js/sb-admin.min.js"></script>
<script src="js/scripting.js"></script>
<script>
    function previewFile() {
        var preview = document.querySelector('img');
        var file = document.querySelector('input[type=file]').files[0];
        var reader = new FileReader();

        reader.onloadend = function () {
            preview.src = reader.result;
        }

        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.src = "";
        }
    }
</script>
</body>

</html>
