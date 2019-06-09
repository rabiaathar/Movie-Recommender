<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Project.Index" %>

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
                    if (txt == "done") {
                        //jQuery("#movie-" + x).remove();
                        document.getElementById("movie-" + x).style.display = "none";

                    }
                    else {
                        alert(txt);
                    }
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
            xmlhttp.send("movie_name=" + x + "&like_or_dislike=" + 1);


            return false;
        }


        function Success(result) {
            alert(result);
        }
        function Failure(error) {
            alert(error);
        }



        function dislikeClicked(x) {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function () {

                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    txt = xmlhttp.responseText;
                    if (txt == "done") {
                        //jQuery("#movie-" + x).remove();
                        document.getElementById("movie-" + x).style.display = "none";

                    }
                    else {
                        alert(txt);
                    }
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
            xmlhttp.send("movie_name=" + x + "&like_or_dislike=" + 2);

            return false;
        }
    </script>

</head>
<body>

    <div>

        <!-- Shell -->
        <div id="shell">
            ;
	<!-- Header -->
            <div id="header">
                <h1 id="logo"><a href="#">Movie Recommender</a></h1>
                <!-- Navigation -->
                <div id="navigation">
                    <ul>
                        <li>
                            <asp:HyperLink ID="signup" Text="Sign up" runat="server" NavigateUrl="Signup.aspx" /></li>
                        <li>
                            <asp:HyperLink ID="login1" Text="Login" runat="server" NavigateUrl="Login.aspx" /></li>
                    </ul>
                </div>
                <!-- end Navigation -->

                <!-- Sub-menu -->
                <div id="sub-navigation">
                    <ul>
                        <li><a class="active" href="index.aspx">RECOMMENDED</a></li>
                        <li><a href="TopRated.aspx">TOP RATED</a></li>
                        <li><a href="personal.aspx">FAVOURITE</a></li>
                    </ul>
                    <div id="search">
                        <form action="home_submit" method="get" accept-charset="utf-8">
                            <label for="search-field">SEARCH</label>
                            <input type="text" name="search field" value="Enter search here" id="search-field" title="Enter search here" class="blink search-field" />
                            <input type="submit" value="GO!" onclick="abc" class="search-button" />
                        </form>
                    </div>
                </div>
                <!-- end Sub-Menu -->

            </div>
            <!-- end Header -->

            <!-- Main -->
            <div id="main">
                <!-- Content -->
                <div id="content">

                    <div class="box">

                        <div class="head">
                            <h2>Recommended</h2>
                            <p class="text-right"><a href="#">See all</a></p>
                        </div>




                        <div id="mine" runat="server">
                        </div>

                        <!-- Footer -->
                        <div id="footer">
                            <p>
                                <a href="index.aspx">Recommended</a> <span>|</span>
                                <a href="TopRated.aspx">Top Rated</a> <span>|</span>
                                <a href="personal.aspx">Favourite</a><span>|</span>
                                <a href="#">CONTACT </a>
                            </p>
                            <p>2009 Movie Hunter, LLC. All Rights Reserved.  Designed by <a href="http://chocotemplates.com" target="_blank" title="The Sweetest CSS Templates WorldWide">ChocoTemplates.com</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
</body>
</html>
