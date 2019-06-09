using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Project.classes;
namespace Project
{
    public partial class Like : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string b = Request.Form["movie_name"];
            string c = Request.Form["like_or_dislike"];

            if (userInfo.username == "")
            {
                Response.ContentType = "text/xml";
                Response.ContentEncoding = System.Text.Encoding.UTF8;
                Response.Write("Please login or signup");
                return;
            }

            MyClass m = new MyClass();

            if (c == "1")//movie liked
            {
                string s = m.MovieLiked(b);
            }
            else if (c == "2") //movie disliked
            {
                string s = m.MovieDisLiked(b);              
            }
            else if (c == "3")//user already disliked/liked it now he/she want to remove it
            {
              string s =   m.NowRemoveChoiceMovie(b);
            }
            else if (c == "4") 
            {
                string s = m.MovieLiked(b);
            }




            Response.ContentType = "text/xml";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.Write("done");
            
        }

        

    }
}