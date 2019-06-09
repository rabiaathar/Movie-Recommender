<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="Project.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up__Movie Recommender</title>
     <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="CSS/style.css" type="text/css" media="all" />
    <script type="text/javascript" src="JavaScript/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="JavaScript/jquery-func.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <% Response.Write("<a href='#'>Usama Ashraf</a>"); %>
        <div id="shell">
                <!-- Header -->
                <div id="header">
                    <h1 id="logo"><a href="#">Movie Recommender</a></h1>
                
                    <div id="navigation">
			<ul>
                <li><asp:HyperLink id="login1" Text="Login" runat="server" NavigateUrl="Login.aspx"/></li>
			</ul>
                    </div>
                        <div align="center">
                    <div>
                        </br></br> </br></br> </br></br> </br></br> </br></br> </br></br> 
                        <p>
                            Enter Name:
                            &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp 
           <asp:TextBox ID="name" runat="server">

           </asp:TextBox>

                        </p>
                         </br></br>
                        <p>
                            Enter userame:
                            &nbsp &nbsp  &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp 
           <asp:TextBox ID="uname" runat="server">

           </asp:TextBox>

                        </p>
                        </br></br> 
                        <p>
                            Enter Password:
                            &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
           <asp:TextBox ID="pasword" runat="server" TextMode="Password"></asp:TextBox>
                        </p>
                        </br></br>
                        
                        
                        <p>
                            Enter Confirm Password:
                            &nbsp 
           <asp:TextBox ID="cPass" runat="server" TextMode="Password"></asp:TextBox>
                        </p>
                        </br></br>
                         

                        <p>
                            Enter Email Address:
                            &nbsp &nbsp &nbsp &nbsp 
           <asp:TextBox ID="email" runat="server">

           </asp:TextBox>
                        </p>
                        </br></br>


                         <p>
                            Enter Date of Birth:
                             &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
           <asp:TextBox ID="DoB" runat="server">

           </asp:TextBox>
                        </p>
                        </br></br>

                    </div>
                    <div>
                        &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
                        &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
                        <asp:Button ID="entr" onClick="save" runat="server" Text=" Sign up " />
                        &nbsp &nbsp 
                        <asp:Button ID="cncl" OnClick="cancelClick" runat="server" Text="Cancel"/>


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
    </form>
</body>
</html>
