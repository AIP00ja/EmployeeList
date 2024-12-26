using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Newsletter
{
    public partial class Employees_Status : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["myconstr"].ConnectionString;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if SendID is present in the query string
                if (Request.QueryString["SendID"] != null && int.TryParse(Request.QueryString["SendID"], out int sendID))
                {
                    BindEmployees(sendID); // Call the method to bind employee data
                }
                else
                {
                    lblMessage.Text = "Invalid Campaign ID. Please try again.";
                }
            }
        }
        private void BindEmployees(int sendID)
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                // Query to fetch the employees related to the campaign
                string query = @"
            SELECT 
                E.EMP_NAME, 
                E.EMP_EMAILID, 
                E.DEPARTMENT, 
                CES.Status
            FROM 
                CampaignEmployeeStatus CES
            INNER JOIN 
                EMPLOYEE E ON E.EMP_ID = CES.EMP_ID
            WHERE 
                CES.SendID = @SendID";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@SendID", sendID); // Ensure SendID is passed correctly

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                try
                {
                    da.Fill(dt);

                    // If there are employees, bind them to the GridView
                    if (dt.Rows.Count > 0)
                    {
                        gvEmployees.DataSource = dt;
                        gvEmployees.DataBind();
                    }
                    else
                    {
                        gvEmployees.DataSource = null;
                        gvEmployees.DataBind();
                        lblMessage.Text = "No employees found for this campaign.";
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error fetching employee data: " + ex.Message;
                }
            }
        }
    }
}