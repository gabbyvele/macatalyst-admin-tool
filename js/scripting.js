$(document).ready(function () {

    $("#password").keyup(function (e) {
        var code = (e.keyCode ? e.keyCode : e.which);
        if (code == 13) {
            $('#login').click();
        }
    });

    $('#login').click(function (e) {
        var emailAddress = $("#email-address").val();
        var password = $("#password").val();

        if (validateLogin(emailAddress, password)) {
            var formData = new FormData();
            formData.append('emailAddress', emailAddress);
            formData.append('password', password);

            $.ajax({
                url: 'php/loginAgent.php',
                data: formData,
                contentType: false,
                processData: false,
                type: 'POST',
                success: function (response) {
                    if (response == "true") {
                        window.location.reload();
                    } else {
                        $('#alert-heading').text("Error: Login");
                        $('#alert-messages').text("An error occurred while trying log you in, " +
                            "please try again and if problem persists please contact tech support.");
                        $('#password').val("");
                    }
                },
                error: function (response) {
                    console.log(response);
                    $('#alert-heading').text("Error: Login");
                    $('#alert-messages').text("An error occurred while trying log you in, " +
                        "please try again and if problem persists please contact tech support.");
                }
            });
        }
    });

    $('#logout').click(function (e) {
        $.ajax({
            url: 'php/logoutAgent.php',
            contentType: false,
            processData: false,
            type: 'POST',
            success: function () {
                window.location.reload();
            },
            error: function (response) {
                console.log(response);
                $('#alert-heading').text("Error: Login");
                $('#alert-messages').text("An error occurred while trying log you in, " +
                    "please try again and if problem persists please contact tech support.");
            }
        });

    });

    $('#create-advert').click(function (e) {

        var advertType = $("#advert-type").val();
        var advertImage = document.getElementById('advert-image');
        var advertStartDate = $("#advert-start-date").val();
        var advertEndDate = $("#advert-end-date").val();
        var advertCompany = $("#advert-company").val();

        if (validateAdvert(1, advertType, false, advertImage, advertStartDate, advertEndDate, advertCompany)) {
            var formData = new FormData();
            var fullFileName = advertImage.files[0]['name'];
            var fileName = fullFileName.substr(0, (fullFileName.indexOf('.')));
            var fileExtension = fullFileName.substr((fullFileName.lastIndexOf('.') + 1));

            formData.append('advertType', advertType);
            formData.append('fileName', fileName);
            formData.append('fileExtension', fileExtension);
            formData.append('SelectedFile', advertImage.files[0]);
            formData.append('advertStartDate', advertStartDate);
            formData.append('advertEndDate', advertEndDate);
            formData.append('advertCompany', advertCompany);

            $.ajax({
                url: 'php/createAdvert.php',
                data: formData,
                contentType: false,
                processData: false,
                type: 'POST',
                success: function (response) {
                    if (response == "true") {
                        window.location.replace("adverts.php");
                    } else {
                        $('#alert-heading').text("Error: Create Advert");
                        $('#alert-messages').text("An error occurred while trying to create your advert, " +
                            "please try again and if problem persists please contact tech support.");
                    }
                },
                error: function (response) {
                    console.log(response);
                    $('#alert-heading').text("Error: Create Advert");
                    $('#alert-messages').text("An error occurred while trying to create your advert, " +
                        "please try again and if problem persists please contact tech support.");
                }
            });
        }
    });

    $('#save-advert').click(function (e) {

        var advertID = $(this).attr("data-advert-id");
        var advertType = $("#advert-type").val();
        var skipImageCheck = $('#advert-image-check-skip').prop('checked');
        var advertImage = document.getElementById('advert-image');
        var advertStartDate = $("#advert-start-date").val();
        var advertEndDate = $("#advert-end-date").val();
        var advertCompany = $("#advert-company").val();

        if (validateAdvert(advertID, advertType, skipImageCheck, advertImage, advertStartDate, advertEndDate, advertCompany)) {
            var formData = new FormData();

            if (!skipImageCheck) {
                var fullFileName = advertImage.files[0]['name'];
                var fileName = fullFileName.substr(0, (fullFileName.indexOf('.')));
                var fileExtension = fullFileName.substr((fullFileName.lastIndexOf('.') + 1));

                formData.append('SelectedFile', advertImage.files[0]);
                formData.append('fileName', fileName);
                formData.append('fileExtension', fileExtension);
            }

            formData.append('advertID', advertID);
            formData.append('advertType', advertType);
            formData.append('skipImageCheck', skipImageCheck);
            formData.append('advertStartDate', advertStartDate);
            formData.append('advertEndDate', advertEndDate);
            formData.append('advertCompany', advertCompany);

            $.ajax({
                url: 'php/saveAdvert.php',
                data: formData,
                contentType: false,
                processData: false,
                type: 'POST',
                success: function (response) {
                    console.log(response)
                    if (response == "true") {
                        location.reload();
                    } else {
                        $('#alert-heading').text("Error: Save Advert");
                        $('#alert-messages').text("An error occurred while trying to save your advert, " +
                            "please try again and if problem persists please contact tech support.");
                    }
                },
                error: function (response) {
                    console.log(response);
                    $('#alert-heading').text("Error: Save Advert");
                    $('#alert-messages').text("An error occurred while trying to save your advert, " +
                        "please try again and if problem persists please contact tech support.");
                }
            });
        } else {

        }
    });

    $('#disable-advert').click(function (e) {
        var advertID = $(this).attr('data-advert-id');

        $('#confirmation-heading').text("Confirm: Disable");
        $('#confirmation-messages').text("Are you sure you want to disable this advert?");
        $('#confirmation-button').html("<button class=\"btn btn-secondary btn-success\" type=\"button\" data-dismiss=\"modal\">Cancel</button>"
            + "<button class=\"btn btn-secondary btn-danger\" type=\"button\" data-advert-id='" + advertID + "' data-dismiss=\"modal\" id=\"confirm-disable-advert\">Continue</button>");

    });

    $(document).on("click", "#confirm-disable-advert", function () {
        var advertID = $(this).attr('data-advert-id');

        $('#alert-heading').text("Error: Validation");

        if (advertID.length == 0) {
            $('#alert-messages').text("Oops! Something terrible happened and this advert cannot be " +
                "updated, please contact tech support urgently.<br/>");
        } else {
            var formData = new FormData();
            formData.append('advertID', advertID);
            formData.append('updateType', "disable");

            $.ajax({
                url: 'php/updateAdvert.php',
                data: formData,
                contentType: false,
                processData: false,
                type: 'POST',
                success: function (response) {
                    console.log(response)
                    if (response == "true") {
                        location.reload();
                    } else {
                        $('#alert-heading').text("Error: Update Advert");
                        $('#alert-messages').text("An error occurred while trying to update your advert, " +
                            "please try again and if problem persists please contact tech support.");
                    }
                },
                error: function (response) {
                    console.log(response);
                    $('#alert-heading').text("Error: Update Advert");
                    $('#alert-messages').text("An error occurred while trying to update your advert, " +
                        "please try again and if problem persists please contact tech support.");
                }
            });
        }
    });

    $('#enable-advert').click(function (e) {
        var advertID = $(this).attr('data-advert-id');

        $('#confirmation-heading').text("Confirm: Enable");
        $('#confirmation-messages').text("Are you sure you want to enable this advert?");
        $('#confirmation-button').html("<button class=\"btn btn-secondary btn-success\" type=\"button\" data-dismiss=\"modal\">Cancel</button>"
            + "<button class=\"btn btn-secondary btn-danger\" type=\"button\" data-advert-id='" + advertID + "' data-dismiss=\"modal\" id=\"confirm-enable-advert\">Continue</button>");
    });

    $(document).on("click", "#confirm-enable-advert", function () {
        var advertID = $(this).attr('data-advert-id');

        $('#alert-heading').text("Error: Validation");

        if (advertID.length == 0) {
            $('#alert-messages').text("Oops! Something terrible happened and this advert cannot be " +
                "updated, please contact tech support urgently.<br/>");
        } else {
            var formData = new FormData();
            formData.append('advertID', advertID);
            formData.append('updateType', "enable");

            $.ajax({
                url: 'php/updateAdvert.php',
                data: formData,
                contentType: false,
                processData: false,
                type: 'POST',
                success: function (response) {
                    console.log(response)
                    if (response == "true") {
                        location.reload();
                    } else {
                        $('#alert-heading').text("Error: Enable Advert");
                        $('#alert-messages').text("An error occurred while trying to update your advert, " +
                            "please try again and if problem persists please contact tech support.");
                    }
                },
                error: function (response) {
                    console.log(response);
                    $('#alert-heading').text("Error: Enable Advert");
                    $('#alert-messages').text("An error occurred while trying to update your advert, " +
                        "please try again and if problem persists please contact tech support.");
                }
            });
        }
    });

    $('#delete-advert').click(function (e) {
        var advertID = $(this).attr('data-advert-id');

        $('#confirmation-heading').text("Confirm: Delete");
        $('#confirmation-messages').text("Are you sure you want to delete this advert? This action cannot be undone.");
        $('#confirmation-button').html("<button class=\"btn btn-secondary btn-success\" type=\"button\" data-dismiss=\"modal\">Cancel</button>"
            + "<button class=\"btn btn-secondary btn-danger\" type=\"button\" data-advert-id='" + advertID + "' data-dismiss=\"modal\" id=\"confirm-delete-advert\">Continue</button>");
    });

    $(document).on("click", "#confirm-delete-advert", function () {
        var advertID = $(this).attr('data-advert-id');

        $('#alert-heading').text("Error: Validation");

        if (advertID.length == 0) {
            $('#alert-messages').text("Oops! Something terrible happened and this advert cannot be " +
                "deleted, please contact tech support urgently.<br/>");
        } else {
            var formData = new FormData();
            formData.append('advertID', advertID);
            formData.append('updateType', "delete");

            $.ajax({
                url: 'php/updateAdvert.php',
                data: formData,
                contentType: false,
                processData: false,
                type: 'POST',
                success: function (response) {
                    console.log(response)
                    if (response == "true") {
                        window.location.replace("adverts.php");
                    } else {
                        $('#alert-heading').text("Error: Delete Advert");
                        $('#alert-messages').text("An error occurred while trying to delete your advert, " +
                            "please try again and if problem persists please contact tech support.");
                    }
                },
                error: function (response) {
                    console.log(response);
                    $('#alert-heading').text("Error: Delete Advert");
                    $('#alert-messages').text("An error occurred while trying to delete your advert, " +
                        "please try again and if problem persists please contact tech support.");
                }
            });
        }
    });

    $('#create-company').click(function (e) {
        var companyName = $("#company-name").val();
        var companyLogo = $("#company-logo").val();
        var companySummary = $("#company-summary").val();
        var companyPhone = $("#company-phone").val();
        var companyEmail = $("#company-email").val();
        var companyWebsite = $("#company-website").val();
        var companyAddress = $("#company-address").val();

        if (validateCompany(1, companyName, companyLogo, false, companySummary, companyPhone, companyEmail, companyWebsite, companyAddress)) {
            var formData = new FormData();

            var fullFileName = companyLogo.files[0]['name'];
            var fileName = fullFileName.substr(0, (fullFileName.indexOf('.')));
            var fileExtension = fullFileName.substr((fullFileName.lastIndexOf('.') + 1));
            formData.append('companyName', companyName);
            formData.append('companyLogo', companyLogo);
            formData.append('companySummary', companySummary);
            formData.append('companyPhone', companyPhone);
            formData.append('companyEmail', companyEmail);
            formData.append('companyWebsite', companyWebsite);
            formData.append('companyAddress', companyAddress);

        } else {

        }
    });

    $('#create-industry').click(function (e) {
        var industryName = $("#industry-name").val();
        var industryDescription = $("#industry-description").val();

        if (validateIndustry(1, industryName, industryDescription)) {
            var formData = new FormData();

            formData.append('industryName', industryName);
            formData.append('industryDescription', industryDescription);

            $.ajax({
                url: 'php/createIndustry.php',
                data: formData,
                contentType: false,
                processData: false,
                type: 'POST',
                success: function (response) {
                    if (response == "true") {
                        window.location.replace("industries.php");
                    } else {
                        $('#alert-heading').text("Error: Create Industry");
                        $('#alert-messages').text("An error occurred while trying to create your industry, " +
                            "please try again and if problem persists please contact tech support.");
                    }
                },
                error: function (response) {
                    console.log(response);
                    $('#alert-heading').text("Error: Create Industry");
                    $('#alert-messages').text("An error occurred while trying to create your industry, " +
                        "please try again and if problem persists please contact tech support.");
                }
            });
        }
    });

    $('#save-industry').click(function (e) {
        var industryID = $(this).attr("data-industry-id");
        var industryName = $("#industry-name").val();
        var industryDescription = $("#industry-description").val();

        if (validateIndustry(industryID, industryName, industryDescription)) {
            var formData = new FormData();

            formData.append('industryID', industryID);
            formData.append('industryName', industryName);
            formData.append('industryDescription', industryDescription);

            $.ajax({
                url: 'php/saveIndustry.php',
                data: formData,
                contentType: false,
                processData: false,
                type: 'POST',
                success: function (response) {
                    console.log(response);
                    if (response == "true") {
                        location.reload();
                    } else {
                        $('#alert-heading').text("Error: Save Industry");
                        $('#alert-messages').text("An error occurred while trying to save your industry, " +
                            "please try again and if problem persists please contact tech support.");
                    }
                },
                error: function (response) {
                    console.log(response);
                    $('#alert-heading').text("Error: Save Industry");
                    $('#alert-messages').text("An error occurred while trying to save your industry, " +
                        "please try again and if problem persists please contact tech support.");
                }
            });
        }
    });


    $('#delete-industry').click(function (e) {
        var industryID = $(this).attr('data-industry-id');

        $('#confirmation-heading').text("Confirm: Delete");
        $('#confirmation-messages').text("Are you sure you want to delete this industry? This action cannot be undone.");
        $('#confirmation-button').html("<button class=\"btn btn-secondary btn-success\" type=\"button\" data-dismiss=\"modal\">Cancel</button>"
            + "<button class=\"btn btn-secondary btn-danger\" type=\"button\" data-industry-id='" + industryID + "' data-dismiss=\"modal\" id=\"confirm-delete-industry\">Continue</button>");
    });

    $(document).on("click", "#confirm-delete-industry", function () {
        var industryID = $(this).attr("data-industry-id");

        var formData = new FormData();
        formData.append('industryID', industryID);
        formData.append('updateType', "delete");

        $.ajax({
            url: 'php/updateIndustry.php',
            data: formData,
            contentType: false,
            processData: false,
            type: 'POST',
            success: function (response) {
                console.log(response);
                if (response == "true") {
                    window.location.replace("industries.php");
                } else {
                    $('#alert-heading').text("Error: Delete Industry");
                    $('#alert-messages').text("An error occurred while trying to delete your industry, " +
                        "please try again and if problem persists please contact tech support.");
                }
            },
            error: function (response) {
                console.log(response);
                $('#alert-heading').text("Error: Delete Industry");
                $('#alert-messages').text("An error occurred while trying to delete your industry, " +
                    "please try again and if problem persists please contact tech support.");
            }
        });

    });

    $('#create-news').click(function (e) {
        var newsHeadline = $("#news-headline").val();
        var breakingNews = $('#breaking-news').prop('checked');
        var newsAuthor = $("#news-author").val();
        var newsIndustry = $("#news-industry").val();
        var newsImage = document.getElementById('news-image');
        var newsContent = $('#news-content').val();

        if (validateNews(1, newsHeadline, newsAuthor, newsIndustry, newsImage, false, newsContent)) {
            var formData = new FormData();
            var fullFileName = newsImage.files[0]['name'];
            var fileName = fullFileName.substr(0, (fullFileName.indexOf('.')));
            var fileExtension = fullFileName.substr((fullFileName.lastIndexOf('.') + 1));

            formData.append('newsHeadline', newsHeadline);
            formData.append('newsAuthor', newsAuthor);
            formData.append('newsIndustry', newsIndustry);
            formData.append('breakingNews', breakingNews);
            formData.append('newsContent', newsContent);
            formData.append('SelectedFile', newsImage.files[0]);
            formData.append('fileName', fileName);
            formData.append('fileExtension', fileExtension);

            $.ajax({
                url: 'php/createNews.php',
                data: formData,
                contentType: false,
                processData: false,
                type: 'POST',
                success: function (response) {
                    if (response == "true") {
                        window.location.replace("news.php");
                    } else {
                        $('#alert-heading').text("Error: Create News");
                        $('#alert-messages').text("An error occurred while trying to create your news article, " +
                            "please try again and if problem persists please contact tech support.");
                    }
                },
                error: function (response) {
                    console.log(response);
                    $('#alert-heading').text("Error: Create News");
                    $('#alert-messages').text("An error occurred while trying to create your news article, " +
                        "please try again and if problem persists please contact tech support.");
                }
            });

        }
    });

    $('#save-news').click(function (e) {
        var newsID = $(this).attr("data-news-id");
        var newsHeadline = $("#news-headline").val();
        var breakingNews = $('#breaking-news').prop('checked');
        var newsAuthor = $("#news-author").val();
        var newsIndustry = $("#news-industry").val();
        var skipImageCheck = $('#news-image-check-skip').prop('checked');
        var newsImage = document.getElementById('news-image');
        var newsContent = $('#news-content').val();

        if (validateNews(newsID, newsHeadline, newsAuthor, newsIndustry, newsImage, skipImageCheck, newsContent)) {
            var formData = new FormData();

            formData.append('newsID', newsID);
            formData.append('newsHeadline', newsHeadline);
            formData.append('newsAuthor', newsAuthor);
            formData.append('newsIndustry', newsIndustry);
            formData.append('breakingNews', breakingNews);
            formData.append('newsContent', newsContent);
            formData.append('skipImageCheck', skipImageCheck);

            if (!skipImageCheck) {
                var fullFileName = newsImage.files[0]['name'];
                var fileName = fullFileName.substr(0, (fullFileName.indexOf('.')));
                var fileExtension = fullFileName.substr((fullFileName.lastIndexOf('.') + 1));

                formData.append('SelectedFile', newsImage.files[0]);
                formData.append('fileName', fileName);
                formData.append('fileExtension', fileExtension);
            }

            $.ajax({
                url: 'php/saveNews.php',
                data: formData,
                contentType: false,
                processData: false,
                type: 'POST',
                success: function (response) {
                    console.log(response)
                    if (response == "true") {
                        location.reload();
                    } else {
                        $('#alert-heading').text("Error: Save News");
                        $('#alert-messages').text("An error occurred while trying to save your news article, " +
                            "please try again and if problem persists please contact tech support.");
                    }
                },
                error: function (response) {
                    console.log(response);
                    $('#alert-heading').text("Error: Save News");
                    $('#alert-messages').text("An error occurred while trying to save your news article, " +
                        "please try again and if problem persists please contact tech support.");
                }
            });
        }
    });

    $('#delete-news').click(function (e) {
        var newsID = $(this).attr('data-news-id');

        $('#confirmation-heading').text("Confirm: Delete");
        $('#confirmation-messages').text("Are you sure you want to delete this news article? This action cannot be undone.");
        $('#confirmation-button').html("<button class=\"btn btn-secondary btn-success\" type=\"button\" data-dismiss=\"modal\">Cancel</button>"
            + "<button class=\"btn btn-secondary btn-danger\" type=\"button\" data-news-id='" + newsID + "' data-dismiss=\"modal\" id=\"confirm-delete-news\">Continue</button>");
    });

    $(document).on("click", "#confirm-delete-news", function () {
        var newsID = $(this).attr('data-news-id');

        $('#alert-heading').text("Error: Validation");

        if (newsID.length == 0) {
            $('#alert-messages').text("Oops! Something terrible happened and this news article cannot be " +
                "deleted, please contact tech support urgently.<br/>");
        } else {
            var formData = new FormData();
            formData.append('newsID', newsID);
            formData.append('updateType', "delete");

            $.ajax({
                url: 'php/updateNews.php',
                data: formData,
                contentType: false,
                processData: false,
                type: 'POST',
                success: function (response) {
                    console.log(response)
                    if (response == "true") {
                        window.location.replace("news.php");
                    } else {
                        $('#alert-heading').text("Error: Delete News");
                        $('#alert-messages').text("An error occurred while trying to delete your news article, " +
                            "please try again and if problem persists please contact tech support.");
                    }
                },
                error: function (response) {
                    console.log(response);
                    $('#alert-heading').text("Error: Delete News");
                    $('#alert-messages').text("An error occurred while trying to delete your news article, " +
                        "please try again and if problem persists please contact tech support.");
                }
            });
        }
    });

    $('#create-post').click(function (e) {
        var postCompany = $("#post-company").val();
        var postSubject = $("#post-subject").val();
        var postImage = document.getElementById('post-image');
        var postContent = $("#post-content").val();

        if (validatePost(1, postCompany, postSubject, postImage, false, postContent)) {
            var formData = new FormData();
            var fullFileName = postImage.files[0]['name'];
            var fileName = fullFileName.substr(0, (fullFileName.indexOf('.')));
            var fileExtension = fullFileName.substr((fullFileName.lastIndexOf('.') + 1));

            formData.append('postCompany', postCompany);
            formData.append('postSubject', postSubject);
            formData.append('postContent', postContent);
            formData.append('SelectedFile', postImage.files[0]);
            formData.append('fileName', fileName);
            formData.append('fileExtension', fileExtension);

            $.ajax({
                url: 'php/createPost.php',
                data: formData,
                contentType: false,
                processData: false,
                type: 'POST',
                success: function (response) {
                    if (response == "true") {
                        window.location.replace("posts.php");
                    } else {
                        $('#alert-heading').text("Error: Create Post");
                        $('#alert-messages').text("An error occurred while trying to create your post, " +
                            "please try again and if problem persists please contact tech support.");
                    }
                },
                error: function (response) {
                    console.log(response);
                    $('#alert-heading').text("Error: Create Post");
                    $('#alert-messages').text("An error occurred while trying to create your post, " +
                        "please try again and if problem persists please contact tech support.");
                }
            });

        }
    });

    $('#save-post').click(function (e) {
        var postID = $(this).attr("data-post-id");
        var postSubject = $("#post-subject").val();
        var skipImageCheck = $('#post-image-check-skip').prop('checked');
        var postImage = document.getElementById('post-image');
        var postContent = $("#post-content").val();

        if (validatePost(postID, "0", postSubject, postImage, skipImageCheck, postContent)) {
            var formData = new FormData();
            formData.append('postID', postID);
            formData.append('postSubject', postSubject);
            formData.append('postContent', postContent);
            formData.append('skipImageCheck', skipImageCheck);

            if (!skipImageCheck) {
                var fullFileName = postImage.files[0]['name'];
                var fileName = fullFileName.substr(0, (fullFileName.indexOf('.')));
                var fileExtension = fullFileName.substr((fullFileName.lastIndexOf('.') + 1));

                formData.append('SelectedFile', postImage.files[0]);
                formData.append('fileName', fileName);
                formData.append('fileExtension', fileExtension);
            }

            $.ajax({
                url: 'php/savePost.php',
                data: formData,
                contentType: false,
                processData: false,
                type: 'POST',
                success: function (response) {
                    console.log(response)
                    if (response == "true") {
                        location.reload();
                    } else {
                        $('#alert-heading').text("Error: Save Post");
                        $('#alert-messages').text("An error occurred while trying to save your post, " +
                            "please try again and if problem persists please contact tech support.");
                    }
                },
                error: function (response) {
                    console.log(response);
                    $('#alert-heading').text("Error: Save Post");
                    $('#alert-messages').text("An error occurred while trying to save your post, " +
                        "please try again and if problem persists please contact tech support.");
                }
            });
        }
    });

    $('#enable-post').click(function (e) {
        var postID = $(this).attr('data-post-id');

        $('#confirmation-heading').text("Confirm: Enable");
        $('#confirmation-messages').text("Are you sure you want to enable this post?");
        $('#confirmation-button').html("<button class=\"btn btn-secondary btn-success\" type=\"button\" data-dismiss=\"modal\">Cancel</button>"
            + "<button class=\"btn btn-secondary btn-danger\" type=\"button\" data-post-id='" + postID + "' data-dismiss=\"modal\" id=\"confirm-enable-post\">Continue</button>");
    });

    $(document).on("click", "#confirm-enable-post", function () {
        var postID = $(this).attr('data-post-id');

        $('#alert-heading').text("Error: Validation");

        if (postID.length == 0) {
            $('#alert-messages').text("Oops! Something terrible happened and this post cannot be " +
                "updated, please contact tech support urgently.<br/>");
        } else {
            var formData = new FormData();
            formData.append('postID', postID);
            formData.append('updateType', "enable");
            $.ajax({
                url: 'php/updatePost.php',
                data: formData,
                contentType: false,
                processData: false,
                type: 'POST',
                success: function (response) {
                    console.log(response)
                    if (response == "true") {
                        location.reload();
                    } else {
                        $('#alert-heading').text("Error: Update Post");
                        $('#alert-messages').text("An error occurred while trying to update your post, " +
                            "please try again and if problem persists please contact tech support.");
                    }
                },
                error: function (response) {
                    console.log(response);
                    $('#alert-heading').text("Error: Update Post");
                    $('#alert-messages').text("An error occurred while trying to update your post, " +
                        "please try again and if problem persists please contact tech support.");
                }
            });
        }
    });

    $('#disable-post').click(function (e) {
        var postID = $(this).attr('data-post-id');

        $('#confirmation-heading').text("Confirm: Disable");
        $('#confirmation-messages').text("Are you sure you want to disable this post?");
        $('#confirmation-button').html("<button class=\"btn btn-secondary btn-success\" type=\"button\" data-dismiss=\"modal\">Cancel</button>"
            + "<button class=\"btn btn-secondary btn-danger\" type=\"button\" data-post-id='" + postID + "' data-dismiss=\"modal\" id=\"confirm-disable-post\">Continue</button>");

    });

    $(document).on("click", "#confirm-disable-post", function () {
        var postID = $(this).attr('data-post-id');

        $('#alert-heading').text("Error: Validation");

        if (postID.length == 0) {
            $('#alert-messages').text("Oops! Something terrible happened and this post cannot be " +
                "updated, please contact tech support urgently.<br/>");
        } else {
            var formData = new FormData();
            formData.append('postID', postID);
            formData.append('updateType', "disable");
            $.ajax({
                url: 'php/updatePost.php',
                data: formData,
                contentType: false,
                processData: false,
                type: 'POST',
                success: function (response) {
                    console.log(response)
                    if (response == "true") {
                        location.reload();
                    } else {
                        $('#alert-heading').text("Error: Update Post");
                        $('#alert-messages').text("An error occurred while trying to update your post, " +
                            "please try again and if problem persists please contact tech support.");
                    }
                },
                error: function (response) {
                    console.log(response);
                    $('#alert-heading').text("Error: Update Post");
                    $('#alert-messages').text("An error occurred while trying to update your post, " +
                        "please try again and if problem persists please contact tech support.");
                }
            });
        }
    });

    $('#delete-post').click(function (e) {
        var postID = $(this).attr('data-post-id');

        $('#confirmation-heading').text("Confirm: Delete");
        $('#confirmation-messages').text("Are you sure you want to delete this post? This action cannot be undone.");
        $('#confirmation-button').html("<button class=\"btn btn-secondary btn-success\" type=\"button\" data-dismiss=\"modal\">Cancel</button>"
            + "<button class=\"btn btn-secondary btn-danger\" type=\"button\" data-post-id='" + postID + "' data-dismiss=\"modal\" id=\"confirm-delete-post\">Continue</button>");
    });

    $(document).on("click", "#confirm-delete-post", function () {
        var postID = $(this).attr('data-post-id');

        $("#alert-messages").empty();
        $('#alert-heading').text("Error: Validation");

        if (postID.length == 0) {
            $('#alert-messages').text("Oops! Something terrible happened and this post cannot be " +
                "deleted, please contact tech support urgently.<br/>");
        } else {
            var formData = new FormData();
            formData.append('postID', postID);
            formData.append('updateType', "delete");
            $.ajax({
                url: 'php/updatePost.php',
                data: formData,
                contentType: false,
                processData: false,
                type: 'POST',
                success: function (response) {
                    console.log(response)
                    if (response == "true") {
                        window.location.replace("posts.php");
                    } else {
                        $('#alert-heading').text("Error: Delete Post");
                        $('#alert-messages').text("An error occurred while trying to delete your post, " +
                            "please try again and if problem persists please contact tech support.");
                    }
                },
                error: function (response) {
                    console.log(response);
                    $('#alert-heading').text("Error: Delete Post");
                    $('#alert-messages').text("An error occurred while trying to delete your post, " +
                        "please try again and if problem persists please contact tech support.");
                }
            });
        }
    });

    function validateLogin(emailAddress, password) {
        var valid = true;
        $("#alert-messages").empty();

        if (emailAddress.length == 0) {
            $('#alert-messages').append("Please enter email address.<br/>");
            valid = false;
        }
        if (password.length == 0) {
            $('#alert-messages').append("Please enter password.<br/>");
            valid = false;
        }

        if (!valid) {
            $('#alert-heading').text("Error: Login");
        }
        return valid;
    }

    function validateAdvert(advertID, advertType, skipImageCheck, advertImage, advertStartDate, advertEndDate, advertCompany) {
        var valid = true;
        var validDate = true;
        $("#alert-messages").empty();

        if (advertID.length == 0) {
            $('#alert-messages').text("Oops! Something terrible happened and this company cannot be " +
                "updated, please contact tech support urgently.<br/>");
            valid = false;
        } else {
            if (advertType.length == 0) {
                $('#alert-messages').append("Please select advert type.<br/>");
                valid = false;
            }
            if (!skipImageCheck) {
                if (advertImage.length == 0 || advertImage.files.length == 0) {
                    $('#alert-messages').append("Please upload image.<br/>");
                    valid = false;
                }
            }
            if (advertStartDate.length == 0) {
                $('#alert-messages').append("Please select start date.<br/>");
                valid = false;
                validDate = false;
            }
            if (advertEndDate.length == 0) {
                $('#alert-messages').append("Please select end date.<br/>");
                valid = false;
                validDate = false;
            }
            if (validDate) {
                var advertStartDateArr = advertStartDate.split("-");
                var startDate = new Date(advertStartDateArr[2], advertStartDateArr[1], advertStartDateArr[0]);
                var advertEndDateArr = advertEndDate.split("-");
                var endDate = new Date(advertEndDateArr[2], advertEndDateArr[1], advertEndDateArr[0]);

                if (startDate > endDate) {
                    $('#alert-messages').append("Start date cannot be after end date.<br/>");
                    valid = false;
                }
            }
            if (advertCompany.length == 0) {
                $('#alert-messages').append("Please enter company.<br/>");
                valid = false;
            }
        }

        if (!valid) {
            $('#alert-heading').text("Error: Validation");
        }

        return valid;
    }

    function validateCompany(companyID, companyName, companyLogo, skipImageCheck, companySummary, companyPhone, companyEmail, companyWebsite, companyAddress) {
        var valid = true;
        $("#alert-messages").empty();

        if (companyID.length == 0) {
            $('#alert-messages').text("Oops! Something terrible happened and this company cannot be " +
                "updated, please contact tech support urgently.<br/>");
            valid = false;
        } else {
            if (companyName.length == 0) {
                $('#alert-messages').append("Please enter company name.<br/>");
                valid = false;
            }
            if (!skipImageCheck) {
                if (companyLogo.length == 0 || companyLogo.files.length == 0) {
                    $('#alert-messages').append("Please upload logo.<br/>");
                    valid = false;
                }
            }
        }

        if (!valid) {
            $('#alert-heading').text("Error: Validation");
        }

        return valid;
    }

    function validateIndustry(industryID, industryName, industryDescription) {
        var valid = true;

        if (industryID.length == 0) {
            $('#alert-messages').text("Oops! Something terrible happened and this industry cannot be " +
                "updated, please contact tech support urgently.<br/>");
            valid = false;
        } else {
            if (industryName.length == 0) {
                $('#alert-messages').append("Please enter industry name.<br/>");
                valid = false;
            }
            if (industryDescription.length == 0) {
                $('#alert-messages').append("Please enter industry description.<br/>");
                valid = false;
            }
        }

        if (!valid) {
            $('#alert-heading').text("Error: Validation");
        }

        return valid;
    }

    function validateNews(newsID, newsHeadline, newsAuthor, newsIndustry, newsImage, skipImageCheck, newsContent) {
        var valid = true;
        $("#alert-messages").empty();

        if (newsID.length == 0) {
            $('#alert-messages').text("Oops! Something terrible happened and this news article cannot be " +
                "updated, please contact tech support urgently.<br/>");
            valid = false;
        } else {
            if (newsHeadline.length == 0) {
                $('#alert-messages').append("Please enter news headline.<br/>");
                valid = false;
            }
            if (newsAuthor.length == 0) {
                $('#alert-messages').append("Please enter author.<br/>");
                valid = false;
            }
            if (newsIndustry.length == 0) {
                $('#alert-messages').append("Please select industry.<br/>");
                valid = false;
            }
            if (!skipImageCheck) {
                if (newsImage.length == 0 || newsImage.files.length == 0) {
                    $('#alert-messages').append("Please upload image.<br/>");
                    valid = false;
                }
            }
            if (newsContent.length == 0) {
                $('#alert-messages').append("Please enter news content.<br/>");
                valid = false;
            }
        }

        if (!valid) {
            $('#alert-heading').text("Error: Validation");
        }

        return valid;
    }

    function validatePost(postID, postCompany, postSubject, postImage, skipImageCheck, postContent) {
        var valid = true;
        $("#alert-messages").empty();

        if (postID.length == 0) {
            $('#alert-messages').text("Oops! Something terrible happened and this post cannot be " +
                "updated, please contact tech support urgently.<br/>");
            valid = false;
        } else {
            if (postCompany.length == 0) {
                $('#alert-messages').append("Please select company.<br/>");
                valid = false;
            }
            if (postSubject.length == 0) {
                $('#alert-messages').append("Please enter subject.<br/>");
                valid = false;
            }
            if (!skipImageCheck) {
                if (postImage.length == 0 || postImage.files.length == 0) {
                    $('#alert-messages').append("Please upload image.<br/>");
                    valid = false;
                }
            }
            if (postContent.length == 0) {
                $('#alert-messages').append("Please enter post content.<br/>");
                valid = false;
            }
        }


        if (!valid) {
            $('#alert-heading').text("Error: Validation");
        }

        return valid;
    }
});