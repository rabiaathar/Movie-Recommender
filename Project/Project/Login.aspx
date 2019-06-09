<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login__Movie Recommender</title>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="CSS/style.css" type="text/css" media="all" />
    <script type="text/javascript" src="JavaScript/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="JavaScript/jquery-func.js"></script>
</head>
<body>
    <form id="form1" runat="server">
            <div id="shell">
                <!-- Header -->
                <div id="header">
                    <h1 id="logo"><a href="#">Movie Recommender</a></h1>
                    <!-- Navigation -->
                    <div id="navigation">
                        <ul>
                           <li><asp:HyperLink id="singup" Text="Sign up" runat="server" NavigateUrl="Signup.aspx"/></li>
                          
                        </ul>
                    </div>
                    <!-- end Navigation -->
                    <!-- Main -->
                    <div id="main">
                        <!-- Content -->
                        <div id="content">
                        </div>
                    </div>
                    <div align="Center">
                        </br></br> </br></br> </br></br> </br></br> </br></br> </br></br> 
                        <p>
                            Enter username:
           <asp:TextBox ID="name" runat="server">

           </asp:TextBox>

                        </p>
                        </br></br> 
                        <p>
                            Enter Password:
           <asp:TextBox ID="pasword" runat="server" TextMode="Password"></asp:TextBox>
                        </p>
                        </br></br> 
                    
                    <div>
                        &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
                        &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
                        <asp:Button ID="entr" runat="server" OnClick="login" Text="Enter" />
                       
                    </div>
                    </div>
                    </br></br> </br></br> </br></br> 
                      <!-- Footer -->
                    <div id="footer">
                        <p>
                            <a href="index.aspx">Recommended</a> <span>|</span>
                            <a href="TopRated.aspx">Top Rated</a> <span>|</span>
                            <a href="MostCommented.aspx">Most Commented  </a><span>|</span>
                            <a href="#">CONTACT </a>
                        </p>
                        <p>2009 Movie Hunter, LLC. All Rights Reserved.  Designed by <a href="http://chocotemplates.com" target="_blank" title="The Sweetest CSS Templates WorldWide">ChocoTemplates.com</a></p>
                    </div>




                </div>
            </div>
    </form>
</body>
</html>
