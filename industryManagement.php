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
    <title>MAC - Industry Mgmt</title>
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
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Posts">
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
                <a class="nav-link nav-link-collapse" data-toggle="collapse" href="#collapseMulti"
                   data-parent="#exampleAccordion">
                    <i class="fa fa-fw fa-sitemap"></i>
                    <span class="nav-link-text">Meta Data</span>
                </a>
                <ul class="sidenav-second-level collapse show" id="collapseMulti">
                    <li>
                        <a href="industries.php">Industries</a>
                    </li>
                    <li class="active">
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
            <li class="breadcrumb-item">Meta Data</li>
            <li class="breadcrumb-item active">Industry Management</li>
        </ol>
        <div class="row">
            <div class="col-12">
                <?php
                $industryID = -1;
                if (isset($_GET['industry-id'])) {
                    $industryID = preg_replace("#[^0-9]#", "", $_GET["industry-id"]);
                }

                if ($industryID != -1 && $industryID != "") {
                    $sqliQuery = $selectIndustryQuery . $industryID;
                    $res = $mysqli->query($sqliQuery);

                    if ($industry = $res->fetch_assoc()) {
                        $id = $industry['id'];
                        $name = $industry['name'];
                        $description = $industry['description'];

                        echo
                           "<h1>Edit Industry</h1>
                            <div class=\"container-fluid content\">
                                Name: <input type=\"text\" placeholder=\"Name\" class=\"form-control\" id=\"industry-name\" value=\"$name\">
                                Description:
                                <textarea class=\"form-control\" style=\"min-width: 100%; min-height: 100px;\"
                                          id=\"industry-description\">$description</textarea>
                                <div style='padding-bottom: 5px; padding-top: 5px;'>
                                    <a data-toggle=\"modal\" data-target=\"#alert-modal\">
                                        <button type=\"button\" class=\"btn btn-primary\" id=\"save-industry\" data-industry-id=\"$id\">Save</button>
                                    </a>                                    
                                    <a data-toggle=\"modal\" data-target=\"#confirmation-modal\">
                                        <button type=\"button\" class=\"btn btn-danger\" id=\"delete-industry\" data-industry-id=\"$id\">Delete</button>
                                    </a>
                                </div>
                            </div>";
                    } else {
                        echo $createIndustryForm;
                    }
                } else {
                    echo $createIndustryForm;
                }

                ?>
            </div>
        </div>
        <!-- /.container-fluid-->
        <!-- /.content-wrapper-->
        <footer class="sticky-footer">
            <div class="container">
                <div class="text-center">
                    <small>© 2017 Macatalysts | Privacy | Powered by <a href="https://myitzar.co.za/">MyITZAR</a>
                    </small>
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
        <div class="modal fade" id="confirmation-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">
                            <div id="confirmation-heading"></div>
                        </h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div id="confirmation-messages"></div>
                    </div>
                    <div class="modal-footer" id="confirmation-button">
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
    </div>
</body>

</html>
