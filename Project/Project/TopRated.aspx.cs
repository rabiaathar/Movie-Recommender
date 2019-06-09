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
    public partial class TopRated : System.Web.UI.Page
    {

        public void Page_Load(object sender, EventArgs e)
        {
            if (userInfo.username == "")
            {
                signup.Text = "signup";
                signup.NavigateUrl = ("signup.aspx");
                login1.Text = "login";
                login1.NavigateUrl = ("login.aspx");
            }
            else
            {
                signup.Text = userInfo.username;
                login1.Text = "logout";
                signup.NavigateUrl = ("#");
                login1.NavigateUrl = ("logout.aspx");
            }
            loadMovies();

        }
        public void loadMovies()
        {


            //delete it


           // userInfo.username = "salman";




            DataSet ds = new DataSet();
            MyClass m = new MyClass();
            m.getTopRatedMovies(ref ds);






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
                                    "<div class=\"movie\" id=\"movie-"+fileName+"\">" +
                                "<div class=\"movie-image\">" +
                                "<a href=\"#\"><span class=\"play\"><span class=\"name\">" + ds.Tables[0].Rows[i].ItemArray[1].ToString() + "</span></span><img src=" + "/imgDB/" + fileName + " alt=\"movie\" /></a>" +
                                "</div>" +
                                "<div class=\"rating\" >" +
                                "<input type=\"image\" src=\"img/like.jpg\" alt=\"Submit\" OnClick=\"likeClicked('" + fileName + "')\" width=\"20\" height=\"18\"/>" +
                                "<input type=\"image\" src=\"img/dislike.jpg\" alt=\"Submit\" OnClick=\"dislikeClicked('" + fileName + "')\" width=\"20\" height=\"18\"/>" +
                               "<span class=\"comments\">0</span> " +
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

        public void reload()
        {
            Server.Transfer("http://localhost:26429/TopRated.aspx", true);
           
        
        }
    }
}