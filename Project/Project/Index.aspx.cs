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
    public partial class Index : System.Web.UI.Page
    {
        MyClass m = new MyClass();


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



           // userInfo.username = "salman";




            recommendMovie();

        }
        public void recommendMovie()
        {




            DataSet like = new DataSet();//get all gener that are liked
            DataSet dislike = new DataSet();//get all gener that are disliked
            List<string> l = new List<string>();//store are gener that are in like seperatly
            List<string> d = new List<string>();//store are gener that are in dislike seperatly
            List<int> likeCount = new List<int>();
            List<int> dislikeCount = new List<int>();
            


            //first of all clear all previous data
          
            
            m.clearData();



            m.getUserLikedGener(ref like);
            m.getUserDisLikedGener(ref dislike);

            nowSeperateGener(like, ref l, ref likeCount);
            nowSeperateGener(dislike, ref d, ref dislikeCount);


           saveLiketoDataBase(l,likeCount);
            saveDisLiketoDataBase(d,dislikeCount);

            DataSet recommendedGener = new DataSet();
            m.getRecommendedGener(ref recommendedGener);

            saveRecommendedGener(recommendedGener);

            backgroundProcess();
            loadMovies();

        }
        public void loadMovies()
        {

           // userInfo.username = "salman";
            DataSet ds = new DataSet();
            m.getRecommendedMovies(ref ds);
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




        public void saveRecommendedGener(DataSet d)
        {
            
            for (int i = 0; i < d.Tables[0].Rows.Count; i++)
            {
                m.insertRecommendedGener(d.Tables[0].Rows[i][0].ToString(), (int)d.Tables[0].Rows[i][1]);    
            }

        }

        public void backgroundProcess()
        {

            m.populateTempTable();
        
        }



        public void saveLiketoDataBase(List<string> l, List<int> c)
        {
            
            for (int i = 0; i < l.Count; i++)
            {
                m.saveLikedGener(l[i],c[i]);
            }
        }
        public void saveDisLiketoDataBase(List<string> l,List<int> c)
        {
            
            for (int i = 0; i < l.Count; i++)
            {
                m.saveDislikedGener(l[i],c[i]);
            }
        }

        public void nowSeperateGener(DataSet d, ref List<string> li, ref List<int> count)
        {
            int k = 0;
            for (int i = 0; i < d.Tables[0].Rows.Count; i++)
            {
                string temp = "";
                for (int j = 0; j < d.Tables[0].Rows[i][0].ToString().Length; j++)
                {
                    if (d.Tables[0].Rows[i][0].ToString()[j] != ',')
                    {
                        temp += d.Tables[0].Rows[i][0].ToString()[j];
                    }
                    else
                    {
                        if (!isPresent(li, temp))
                        {
                            li.Insert(k, temp);
                            count.Insert(k,1);
                            k++;
                        }
                        else 
                        {
                            int ind = getIndex(li, temp);
                            count[ind] +=1;
                            
                        }
                        temp = "";
                        j++;
                    }
                }
                if (!isPresent(li, temp))
                {
                    li.Insert(k, temp);
                    count.Insert(k, 1);
                    k++;
                }
                else
                {
                    int ind = getIndex(li, temp);
                    count[ind] += 1;
                
                }
            }
        }
        



        int getIndex(List<string> l, string s)
        {
            int i = 0;
            for (i = 0; i < l.Count; i++)
                if (l[i] == s)
                    return i;
        return i;
        }

        bool isPresent(List<string> l, string s)
        {

            if (l.Contains(s))
                return true;
            return false;
        }
    }
}