using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Project.classes;
namespace Project
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }
        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            //System.Threading.Thread.Sleep(3000);
            //userInfo.username = "";
            //Response.Redirect("Index.aspx");
        }

        protected override void OnPreRender(EventArgs e)
        {
            System.Threading.Thread.Sleep(3000);
            userInfo.username = "";
            Response.Redirect("Index.aspx");
        }
    }
}