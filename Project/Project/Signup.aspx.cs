using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Project.classes;

namespace Project
{



    public partial class Signup : System.Web.UI.Page
    {
        public void Page_Load(object sender, EventArgs e)
        {

        }


        public void cancelClick(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }


        public void save(object sender, EventArgs e)
        {
            if (name.Text != "" && uname.Text != "" && email.Text != "" && pasword.Text != "" && cPass.Text!="")
            {
                if (pasword.Text == cPass.Text)
                {
                    MyClass m = new MyClass();
                    string n = m.Signup(name.Text, uname.Text, email.Text, pasword.Text, DoB.Text);
                    if(n!="")
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + n + "');", true);
                    userInfo.username = uname.Text;
                    Response.Redirect("Signup2.aspx");
                }
                else
                {

                    string display = "Password and Confrim Password does not match";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
                    pasword.Text = "";
                    cPass.Text = "";
                }
            }
            else 
            {
                string s = "please enter ";
                if (name.Text == "")
                    s += "name, ";
                if (uname.Text == "")
                    s += "username, ";
                if (email.Text == "")
                    s += "email, ";
                if (pasword.Text == "")
                    s += "password, ";
                if (cPass.Text == "")
                    s += "Confrm password";

                
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + s + "');", true);
                pasword.Text = "";
                cPass.Text = "";
            }
        }
    }
}