using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace Split_Data
{
    public partial class Data_Upload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dataupload_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(TextBox1.Text))
                {
                    Label1.Text = "Please Enter Your Data!";
                    Label1.ForeColor = System.Drawing.Color.Red;
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "redirectjs",
                    "setTimeout(function() {window.location.replace('Data_Upload.aspx')},7000)", true);
                }

                else
                {
                    SqlConnection con = new SqlConnection("Data Source=DESKTOP-JGOR45I;Initial Catalog=Split;Integrated Security=True");
                    SqlCommand cmd = new SqlCommand("insertintoRough", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();

                    if (TextBox1.Text.Contains(' ') || TextBox1.Text.Contains("\r\n"))//checking for you are entered single value or multiple values  
                    {
                        string val = TextBox1.Text.Replace("\r\n", " ");//split values with ‘,’  
                        string[] arryval = val.Split(' ');//split values with ‘,’ 
                        int j = arryval.Length;
                        int i = 0;
                        for (i = 0; i < j; i++)
                        {
                            if (arryval[i] != "")
                            {
                                cmd.Parameters.Clear();
                                cmd.Parameters.AddWithValue("@Upload", arryval[i]);
                                cmd.ExecuteNonQuery();
                                Label1.Text = "Data Uploaded";
                                Label1.ForeColor = System.Drawing.Color.Green;
                                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);

                                using (SqlCommand cmdd = new SqlCommand("select Id , Team , Country , NameF , NameL , Weight , Height , DOB , Hometown , Prov , Pos , Age , HeightFt , HtIn , BMI   from Hockey_Team", con))

                                {
                                    using (SqlDataAdapter sda = new SqlDataAdapter(cmdd))
                                    {
                                        DataTable dtbrand = new DataTable();
                                        sda.Fill(dtbrand);
                                        Repeater1.DataSource = dtbrand;
                                        Repeater1.DataBind();
                                    }

                                }
                            }


                        }
                    }


                }

            }
            catch
            {
                Label1.Text = "Error Issue!";
                Label1.ForeColor = System.Drawing.Color.Red;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                ScriptManager.RegisterStartupScript(this, typeof(Page), "redirectjs",
                "setTimeout(function() {window.location.replace('Data_Upload.aspx')},5000)", true);
            }


        }



    }
}