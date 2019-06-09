using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using Project.classes;
using System.Data;
using System.IO;
using System.Configuration;
using System.Web.Routing;
using System.Web.Http;
using System.Media;
using System.Web.Services;

namespace Project
{
    public partial class personal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (userInfo.username == "")
            {
                signup.Text = "Signup";
                signup.NavigateUrl = ("Signup.aspx");
                login1.Text = "Login";
                login1.NavigateUrl = ("Login.aspx");
            }
            else
            {
                signup.Text = userInfo.username;
                login1.Text = "Logout";
                signup.NavigateUrl = ("#");
                login1.NavigateUrl = ("Logout.aspx");
            }

            populate();
        }

        private void populate() 
        {
            DataSet ds = new DataSet();
            MyClass m = new MyClass();
            m.getUserLikedMovied(ref ds);
            if (!IsPostBack)
            {
                string[] filePaths = Directory.GetFiles(Server.MapPath("~/imgDB/"));
                List<ListItem> files = new List<ListItem>();
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        foreach (string filePath in filePaths)
                        {
                            string fileName = Path.GetFileName(filePath);
                            if (ds.Tables[0].Rows[i].ItemArray[0].ToString() == fileName)
                            {
                                files.Add(new ListItem(fileName, "~/imageDB/" + fileName));
                                mine.InnerHtml += "<div>" +
                                    "<div class=\"movie\" id=\"movie-" + fileName + "\">" +
                                "<div class=\"movie-image\">" +
                                "<a href=\"#\"><span class=\"play\"><span class=\"name\">" + ds.Tables[0].Rows[i].ItemArray[1].ToString() + "</span></span><img src=" + "/imgDB/" + fileName + " alt=\"movie\" /></a>" +
                                "</div>" +
                                "<div class=\"rating\" >";
                                if (ds.Tables[0].Rows[i].ItemArray[2].ToString() == "0")
                                    mine.InnerHtml += "<input type=\"image\" src=\"img/like.jpg\" alt=\"Submit\" OnClick=\"RemoveIt('" + fileName + "')\" width=\"20\" height=\"18\"/>";
                                else
                                {
                                    mine.InnerHtml += "<input type=\"image\" src=\"img/dislike.jpg\" alt=\"Submit\" OnClick=\"RemoveIt('" + fileName + "')\" width=\"20\" height=\"18\"/>";
                                }
                               mine.InnerHtml += "<span class=\"comments\">0</span> " +
                                "</div>" +
                               "</div>" +
                                "</div>";
                                break;
                            }
                        }
                    }
                }
            }    
        }











    }
}