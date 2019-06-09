using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Project.classes;
namespace Project
{
    public partial class Login : System.Web.UI.Page
    {
        public void Page_Load(object sender, EventArgs e)
        {

        }

        public void login(object sender, EventArgs e)
        {
            MyClass m = new MyClass();
            if (name.Text == "" || pasword.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Enter username or password ');", true);
            }
            else
            {
                if (m.Login(name.Text, pasword.Text) != 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Login sucessful ');", true);
                    userInfo.username = name.Text;

                    Response.Redirect("Index.aspx");
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Username password mismatch ');", true);
                    name.Text = "";
                    pasword.Text = "";
                }
            }
        }

    }
}