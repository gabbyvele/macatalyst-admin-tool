<?php
include('php/conn.php');
session_start();

if (isset($_SESSION['loggedInUserId']) && $_SESSION['loggedInUserId'] != "-1") {

    $sqliQuery = ("SELECT COUNT(*) FROM adverts");
    $res = $mysqli->query($sqliQuery);
    $row = $res->fetch_row();
    $countAllAdverts = $row[0];

    $sqliQuery = ("SELECT COUNT(*) FROM companies");
    $res = $mysqli->query($sqliQuery);
    $row = $res->fetch_row();
    $countAllCompanies = $row[0];

    $sqliQuery = ("SELECT COUNT(*) FROM industry");
    $res = $mysqli->query($sqliQuery);
    $row = $res->fetch_row();
    $countAllIndustries = $row[0];

    $sqliQuery = ("SELECT COUNT(*) FROM members");
    $res = $mysqli->query($sqliQuery);
    $row = $res->fetch_row();
    $countAllMembers = $row[0];

    $sqliQuery = ("SELECT COUNT(*) FROM news ");
    $res = $mysqli->query($sqliQuery);
    $row = $res->fetch_row();
    $countAllNews = $row[0];

    $sqliQuery = ("SELECT COUNT(*) FROM posts ");
    $res = $mysqli->query($sqliQuery);
    $row = $res->fetch_row();
    $countAllPosts = $row[0];

    $sqliQuery = ("SELECT COUNT(*) FROM posts WHERE ACTIVE = 1");
    $res = $mysqli->query($sqliQuery);
    $row = $res->fetch_row();
    $countActivePosts = $row[0];

    $sqliQuery = ("SELECT COUNT(*) FROM company_adverts");
    $res = $mysqli->query($sqliQuery);
    $row = $res->fetch_row();
    $countCompanyAds = $row[0];

    $selectAdvertsQuery = "SELECT a.ID, t.Name AS 'Advert_Type_Name', a.Active, a.Image, a.Start_Date, a.End_Date, a.Company, u.NAME as 'Created_by', a.Last_Updated_by FROM adverts a 
                       JOIN advert_type t ON a.Advert_type = t.ID 
                       JOIN users u ON a.Created_by = u.ID 
					   ORDER BY ID DESC";

    $selectAdvertQuery = "SELECT a.ID, a.Advert_type, a.Active, a.Image, a.Start_Date, a.End_Date, a.Company, uc.NAME as 'Created_by', ul.NAME as 'Last_Updated_by' FROM adverts a 
                      JOIN advert_type t ON a.Advert_type = t.ID 
                      JOIN users uc ON a.Created_by = uc.ID
                      JOIN users ul ON a.Last_Updated_by = ul.ID
                      WHERE a.ID = ";

    $createAdvertForm =
        "<h1>Create Advert</h1>
     <div class=\"container-fluid content\">
        Advert Type: 
        <div class=\"input-group\">
            <select class=\"form-control\" id=\"advert-type\">
                <option value=\"\"></option>";

    $sqliQuery = ("SELECT ID, Name FROM advert_type");
    $advertTypes = $mysqli->query($sqliQuery);
    while ($type = $advertTypes->fetch_assoc()) {
        $id = $type["ID"];
        $name = $type["Name"];
        $createAdvertForm = $createAdvertForm .
            "<option value=\"$id\">$name</option>";
    }
    $createAdvertForm = $createAdvertForm . "
            </select>
         </div>
         Image:
         <div class='input-group'>
             <label class=\"btn btn-primary btn-sm\" for=\"advert-image\">
                 <input id=\"advert-image\" type=\"file\" style=\"display:none\"
                        onchange=\"$('#upload-file-info').html(this.files[0].name);
                               previewFile();\">
                 Upload
             </label>
             <div>
                 <span class='label label-info' id=\"upload-file-info\" style='padding: 10px'></span>
             </div>
         </div>
         <div>
             <img src=\"\" height=\"100\" alt=\"Image preview...\">
         </div>
         
         <table width='style: auto;'>
             <tr>
                <td>Start Date:&nbsp<input type=\"date\" class=\"form-control\" id=\"advert-start-date\"></td>
                <td>End Date:&nbsp<input type=\"date\" class=\"form-control\" id=\"advert-end-date\"></td>
             </tr>
         </table>
         Company: <input type=\"text\" placeholder=\"Company\" class=\"form-control\" id=\"advert-company\">
         <div style='padding-bottom: 5px; padding-top: 5px;'>
             <a data-toggle=\"modal\" data-target=\"#alert-modal\">
                 <button type=\"button\" class=\"btn btn-primary\" id=\"create-advert\">Create</button>
             </a>
         </div>
     </div>";

    $sqliQuery = ("SELECT ID, NAME FROM companies");
    $companyNames = $mysqli->query($sqliQuery);

    $selectCompaniesQuery = "SELECT ID, NAME, LOGO, STATUS, REG_DATE, DEACTIVATED_DATE, PHONE, EMAIL, WEBSITE FROM companies ORDER BY ID DESC";

    $selectCompanyQuery = "SELECT cmp.ID, cmp.NAME, cmp.INFO, cmp.LOGO, cmp.PROFILE, cmp.STATUS, cmp.REG_DATE, cmp.DEACTIVATED_DATE, cmp.Address, cmp.PHONE, cmp.EMAIL, cmp.WEBSITE, prf.NAME  AS 'PROFILE_NAME', prf.DESCRIPTION AS 'PROFILE_DESCRIPTION', prf.COST AS 'PROFILE_COST' FROM companies cmp
                       JOIN profiles prf on cmp.PROFILE = prf.ID 
                       WHERE cmp.ID = ";

    $createCompanyForm =
        "<h1>Create Company</h1>
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
                 <button type=\"button\" class=\"btn btn-primary\" id=\"create-company\">Create</button>
             </a>
             
         </div>
     </div>";

    $sqliQuery = ("SELECT `id`, `name` FROM `industry`");
    $industries = $mysqli->query($sqliQuery);

    $selectIndustriesQuery = "SELECT `id`, `name`, `description` FROM `industry`";

    $selectIndustryQuery = "SELECT `id`, `name`, `description` FROM `industry` WHERE `id` = ";

    $createIndustryForm =
        "<h1>Create Industry</h1>
    <div class=\"container-fluid content\">
        Name: <input type=\"text\" placeholder=\"Name\" class=\"form-control\" id=\"industry-name\">
        Description:
        <textarea class=\"form-control\" style=\"min-width: 100%; min-height: 100px;\"
                  id=\"industry-description\"></textarea>
        <div style='padding-bottom: 5px; padding-top: 5px;'>
            <a data-toggle=\"modal\" data-target=\"#alert-modal\">
                <button type=\"button\" class=\"btn btn-primary\" id=\"create-industry\">Create</button>
            </a>
        </div>
    </div>";

    $selectNewsQuery = "SELECT n.ID, n.Headline, n.Author, n.Content, n.Date, n.Image, i.name AS 'Industry', n.Breaking_news, n.Views, u.NAME AS 'created_by_user'
                    FROM news n JOIN industry i ON n.Industry = i.id
                    JOIN users u ON n.user_id = u.ID ORDER BY n.ID DESC ";

    $selectNewsArticleQuery = "SELECT n.ID, n.Headline, n.Author, n.Content, n.Date, n.Image, n.Industry, n.Breaking_news, n.Views, u.NAME AS 'created_by_user'
                           FROM news n JOIN users u ON n.user_id = u.ID
                           WHERE n.ID = ";

    $createNewsForm = "
    <h1>Create News</h1>
    <div class=\"container-fluid content\">
        Headline: <input type=\"text\" placeholder=\"Headline\" class=\"form-control\" id=\"news-headline\">
        <br>
        Breaking News: <input type=\"checkbox\" placeholder=\"Company\" id=\"breaking-news\">
        (Check this box if this is is breaking news)
        &nbsp
        <br>
        Author: <input type=\"text\" placeholder=\"Author\" class=\"form-control\" id=\"news-author\">
        News Industry:
        <div class=\"input-group\">
            <select class=\"form-control\" id=\"news-industry\">
                <option value=\"\"></option>";

    $sqliQuery = ("SELECT id, name FROM industry");
    $industryTypes = $mysqli->query($sqliQuery);
    while ($type = $industryTypes->fetch_assoc()) {
        $id = $type["id"];
        $name = $type["name"];
        $createNewsForm = $createNewsForm .
            "<option value=\"$id\">$name</option>";
    }

    $createNewsForm = $createNewsForm . "
            </select>
        </div>
        Image:
        <div class='input-group'>
            <label class=\"btn btn-primary btn-sm\" for=\"news-image\">
                <input id=\"news-image\" type=\"file\" style=\"display:none\"
                       onchange=\"$('#upload-file-info').html(this.files[0].name);
                   previewFile();\">
                Upload
            </label>
            <div>
                <span class='label label-info' id=\"upload-file-info\" style='padding: 10px'></span>
            </div>
        </div>
        <div>
            <img src=\"\" height=\"100\" alt=\"Image preview...\">
        </div>
        Content:
        <textarea class=\"form-control\" style=\"min-width: 100%; min-height: 300px;\" id=\"news-content\"></textarea>
        
        <div style='padding-bottom: 5px; padding-top: 5px;'>
            <a data-toggle=\"modal\" data-target=\"#alert-modal\">
                <button type=\"button\" class=\"btn btn-primary\" id=\"create-news\">Create</button>
            </a>
        </div>
    </div>";

    $selectPostsQuery = ("SELECT pst.ID, pst.SUBJECT, pst.ACTIVE, pst.TIMESTAMP, typ.NAME AS 'TYPE_NAME' FROM posts pst 
                      JOIN post_type typ on pst.TYPE = typ.ID ORDER BY pst.ID DESC ");

    $selectPostQuery = "SELECT pst.ID, cmp.NAME AS 'COMPANY_NAME', cmp.ID AS 'COMPANY_ID', pst.SUBJECT, pst.ACTIVE, pst.TIMESTAMP, pst.POST, pst.FILE, typ.NAME AS 'TYPE_NAME' 
                    FROM posts pst JOIN post_type typ on pst.TYPE=typ.ID 
                    JOIN companies cmp on pst.COMPANY_ID = cmp.ID 
                    WHERE pst.ID = ";

    $createPostForm =
        "<h1>Create Post</h1>
     <div class=\"container-fluid content\">
     Company:
     <div class=\"input-group\">
        <select class=\"form-control\" id=\"post-company\">
       		<option value=\"\"></option>";
    $sqliQuery = ("SELECT ID, NAME FROM companies");
    $companyNames = $mysqli->query($sqliQuery);
    while ($company = $companyNames->fetch_assoc()) {
        $id = $company["ID"];
        $name = $company["NAME"];
        $createPostForm = $createPostForm .
            "<option value=\"$id\">$name</option>";
    }
    $createPostForm = $createPostForm .
        "</select>
     </div>
        Subject:
          <input class=\"form-control\" type=\"text\" placeholder=\"Subject\" id=\"post-subject\">
        Image:
      <div class='input-group'>
        <label class=\"btn btn-primary btn-sm\" for=\"post-image\">
            <input id=\"post-image\" type=\"file\" style=\"display:none\" 
            onchange=\"$('#upload-file-info').html(this.files[0].name);
                       previewFile();\">
            Upload
            Upload
        </label>
        <div>
            <span class='label label-info' id=\"upload-file-info\" style='padding: 10px'></span>
        </div> 
      </div>
      <div>
        <img src=\"..\" height=\"100\" alt=\"Image preview...\">
      </div>
      Post:
      <textarea class=\"form-control\" style=\"min-width: 100%; min-height: 300px;\" id=\"post-content\"></textarea>
      <div style='padding-bottom: 5px; padding-top: 5px;'>
        <a data-toggle=\"modal\" data-target=\"#alert-modal\">
           <button type=\"button\" class=\"btn btn-primary\" id=\"create-post\">Create</button>
        </a>
      </div>";
}