<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup2.aspx.cs" Inherits="Project.Signup2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Movie Recommender</title>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="CSS/style.css" type="text/css" media="all" />
    <script type="text/javascript" src="JavaScript/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="JavaScript/jquery-func.js"></script>


     <script type="text/javascript">
         function likeClicked(x) {
             var xmlhttp = new XMLHttpRequest();
             xmlhttp.onreadystatechange = function () {

                 if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                     txt = xmlhttp.responseText;
                     alert(txt);
                     if (window.DOMParser) {
                         parser = new DOMParser();
                         xmlDoc = parser.parseFromString(txt, "text/xml");
                     }
                     else // Internet Explorer
                     {
                         xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
                         xmlDoc.async = false;
                         xmlDoc.loadXML(txt);
                     }

                 }

             }

             var url;
             url = "http://localhost:26429/Like.aspx"; 
             xmlhttp.open('POST', url, true);
             xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");  //application/x-www-form-urlencoded
             xmlhttp.send("movie_name=" + x + "&like_or_dislike=" + 4);
        

             return false;
         }
        </script>



</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- Shell -->
            <div id="shell">

                <!-- Header -->
                <div id="header">
                    <h1 id="logo"><a href="#">Movie Recommender</a></h1>
                </div>
                <!-- Main -->

                <div id="main">
                    <!-- Content -->
                    <div id="content">
                        <!-- Box -->
                        <!--<div class="box">-->
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <div class="head">
                            <h2>Like ONE You Prefer</h2>
                            <br />
                        </div>

                        <!-- Movie -->

                        <div class="movie" style="float: left;">
                            <div>
                                <p>Action, Sci-Fi, Thriller </p>
                            </div>
                            <div class="movie-image">
                                <a href="#"><span class="play"><span class="name">LUCY</span></span><img src="img/image19.jpg" alt="movie" /></a>
                            </div>

                            <div class="rating">
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                &nbsp;
                                <input type="image" onclick="likeClicked('16.jpg')" src="img/like.jpg"
                                    alt="Submit" width="20" height="18" runat="server" />
                            </div>
                        </div>

                        <!-- end Movie -->
                        <!-- Movie -->
                        <div class="movie" style="float: left;">
                            <div>
                                <p>Biography, Drama, Thriller</p>
                            </div>
                            <div class="movie-image">
                                <a href="#"><span class="play"><span class="name">The Imitation Game</span></span><img src="img/image20.jpg" alt="movie" /></a>

                            </div>
                            <div class="rating">
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                &nbsp;
                                <input type="image" src="img/like.jpg" onclick="likeClicked('21.jpg')"
                                    alt="Submit" width="20" height="18" />
                            </div>

                        </div>
                        <!-- end Movie -->
                        <!-- Movie -->
                        <div class="movie">
                            <div>
                                <p>Comedy, Fantasy</p>
                            </div>
                            <div class="movie-image">
                                <a href="#"><span class="play"><span class="name">Ted</span></span><img src="img/image21.jpg" alt="movie" /></a>

                            </div>
                            <div class="rating">
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                &nbsp;
                                <input type="image" src="img/like.jpg" onclick="likeClicked('50.jpg')"
                                    alt="Submit" width="20" height="18" />
                            </div>

                        </div>
                        <!-- end Movie -->


                        <div class="cl">&nbsp</div>
                        <br />
                        <br />
                    </div>
                </div>

            </div>
            <!-- Footer -->
            <div id="footer">
                <p>
                    <a href="#">CONTACT </a>
                </p>
                <p>2009 Movie Hunter, LLC. All Rights Reserved.  Designed by <a href="http://chocotemplates.com" target="_blank" title="The Sweetest CSS Templates WorldWide">ChocoTemplates.com</a></p>
            </div>
        </div>
    </form>

</body>

</html>
