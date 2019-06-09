using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Project.classes
{

    public static class userInfo 
    {
        public static string username="";
        public static int count = 0;
    
    }



    public class MyClass
    {
        private static readonly string connString =
           System.Configuration.ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;

       
        
        public string Signup(String name, String uName, String email, String pass, String dob)
        {
            string s = "";
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("SignUp", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Username", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@pass", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@Name", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@email", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@Dob", SqlDbType.VarChar, 50);
                // set parameter values
                cmd.Parameters["@UserName"].Value = uName;
                cmd.Parameters["@pass"].Value = pass;
                cmd.Parameters["@Name"].Value = name;
                cmd.Parameters["@email"].Value = email;
                cmd.Parameters["@Dob"].Value = dob;
                cmd.ExecuteNonQuery();

                // read output value 
                con.Close();

            }
            catch (SqlException ex)
            {
                s= ex.Message.ToString();

            }
            finally
            {
                con.Close();
            }
        return s;
        }

        public int Login(String Name, String password)
        {

            int Found = 0;
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("logIn", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@username", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@Pass", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@count", SqlDbType.Int).Direction = ParameterDirection.Output;

                // set parameter values
                cmd.Parameters["@username"].Value = Name;
                cmd.Parameters["@Pass"].Value = password;
                cmd.ExecuteNonQuery();

                // read output value 
                Found = Convert.ToInt32(cmd.Parameters["@count"].Value); //convert to output parameter to interger format
                con.Close();

            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());

            }
            finally
            {
                con.Close();
            }
            return Found;
        }


        public DataSet getUserInfo(string uname)
        {
            DataSet ds = new DataSet(); //declare and instantiate new dataset
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("userInfo", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@username", SqlDbType.VarChar, 50);
                cmd.Parameters["@username"].Value = uname;
                cmd.ExecuteNonQuery();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds);
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

            return ds; //return the dataset
        }

        public void getTopRatedMovies(ref DataSet ds)
        {
             ds = new DataSet();
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("topRated", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@name", SqlDbType.VarChar, 50);
                cmd.Parameters["@name"].Value = userInfo.username;
                cmd.ExecuteNonQuery();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds);
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }
        }


        public string MovieLiked(String name)
        {
            string s = "Success";
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("movieLiked", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@name", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@movie_name", SqlDbType.VarChar, 50);
                
                // set parameter values
                cmd.Parameters["@name"].Value = userInfo.username;
                cmd.Parameters["@movie_name"].Value = name;
                cmd.ExecuteNonQuery();

                // read output value 
                con.Close();

            }
            catch (SqlException ex)
            {
                s = ex.ToString();

            }
            finally
            {
                con.Close();
            }
            return s;
        }


        public string  MovieDisLiked(String name)
        {
            string s="Success";
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("movieDisLiked", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@name", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@movie_name", SqlDbType.VarChar, 50);

                // set parameter values
                cmd.Parameters["@name"].Value = userInfo.username;
                cmd.Parameters["@movie_name"].Value = name;
                cmd.ExecuteNonQuery();

                // read output value 
                con.Close();

            }
            catch (SqlException ex)
            {
                s = ex.ToString();

            }
            finally
            {
                con.Close();
            }
            return s;
        }


        public void getUserLikedMovied(ref DataSet ds)
        {
            ds = new DataSet();
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("userLiked", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@name", SqlDbType.VarChar, 50);
                cmd.Parameters["@name"].Value = userInfo.username;
                cmd.ExecuteNonQuery();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds);
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }
        }

        public string NowRemoveChoiceMovie(String name)
        {
            string s = "Success";
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("RemoveChoice", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@name", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@image_name", SqlDbType.VarChar, 50);

                // set parameter values
                cmd.Parameters["@name"].Value = userInfo.username;
                cmd.Parameters["@image_name"].Value = name;
                cmd.ExecuteNonQuery();

                // read output value 
                con.Close();

            }
            catch (SqlException ex)
            {
                s = ex.ToString();

            }
            finally
            {
                con.Close();
            }
            return s;
        }

        public void getUserLikedGener(ref DataSet ds)
        {
            ds = new DataSet();
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("userLikedGener", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@name", SqlDbType.VarChar, 50);
                cmd.Parameters["@name"].Value = userInfo.username;
                cmd.ExecuteNonQuery();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds);
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }
        }

        public void getUserDisLikedGener(ref DataSet ds)
        {
            ds = new DataSet();
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("userDislikedGener", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@name", SqlDbType.VarChar, 50);
                cmd.Parameters["@name"].Value = userInfo.username;
                cmd.ExecuteNonQuery();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds);
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }
        }

        public string saveLikedGener(String ge,int c)
        {
            string s = "Success";
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("saveLikedGener", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@name", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@gene", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@count", SqlDbType.VarChar, 50);

                // set parameter values
                cmd.Parameters["@name"].Value = userInfo.username;
                cmd.Parameters["@gene"].Value = ge;
                cmd.Parameters["@count"].Value = c;
                cmd.ExecuteNonQuery();

                // read output value 
                con.Close();

            }
            catch (SqlException ex)
            {
                s = ex.ToString();

            }
            finally
            {
                con.Close();
            }
            return s;
        }

        public string saveDislikedGener(String ge,int c)
        {
            string s = "Success";
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("saveDislikedGener", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@name", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@gene", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@count", SqlDbType.VarChar, 50);

                // set parameter values
                cmd.Parameters["@name"].Value = userInfo.username;
                cmd.Parameters["@gene"].Value = ge;
                cmd.Parameters["@count"].Value = c;
                cmd.ExecuteNonQuery();

                // read output value 
                con.Close();

            }
            catch (SqlException ex)
            {
                s = ex.ToString();

            }
            finally
            {
                con.Close();
            }
            return s;
        }

        public string clearData()
        {
            string s = "Success";
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("clearData", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@name", SqlDbType.VarChar, 50);
                // set parameter values
                cmd.Parameters["@name"].Value = userInfo.username;
                cmd.ExecuteNonQuery();

                // read output value 
                con.Close();

            }
            catch (SqlException ex)
            {
                s = ex.ToString();

            }
            finally
            {
                con.Close();
            }
            return s;
        }

        public void getRecommendedGener(ref DataSet ds)
        {
            ds = new DataSet();
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("getRecommendedGener", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@name", SqlDbType.VarChar, 50);
                cmd.Parameters["@name"].Value = userInfo.username;
                cmd.ExecuteNonQuery();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds);
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }
        }

        public string insertRecommendedGener(string g, int w)
        {
            string s = "Success";
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("insertRecommendedGener", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@gener", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@weight", SqlDbType.Int);
                // set parameter values
                cmd.Parameters["@gener"].Value = g;
                cmd.Parameters["@weight"].Value = w;
                cmd.ExecuteNonQuery();

                // read output value 
                con.Close();

            }
            catch (SqlException ex)
            {
                s = ex.ToString();

            }
            finally
            {
                con.Close();
            }
            return s;
        }


        public string populateTempTable()
        {
            string s = "Success";
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("populateUselessTable", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;
                
                // set parameter values
               
                cmd.ExecuteNonQuery();

                // read output value 
                con.Close();

            }
            catch (SqlException ex)
            {
                s = ex.ToString();

            }
            finally
            {
                con.Close();
            }
            return s;
        }

        public void getRecommendedMovies(ref DataSet ds)
        {
            ds = new DataSet();
            SqlConnection con = new SqlConnection(connString); //declare and instantiate new SQL connection
            con.Open(); // open sql Connection
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("Recommended", con); //name of your procedure
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@name", SqlDbType.VarChar, 50);
                cmd.Parameters["@name"].Value = userInfo.username;
                cmd.ExecuteNonQuery();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds);
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }
        }








    }
}