using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Newsletter
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["myconstr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCampaignList("All"); // Pass "All" as the default filter
            }
        }
        private void BindCampaignList(string statusFilter)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT SendID, CampaignName, Status, CreatedDate FROM sendTemplate";
                if (statusFilter != "All")
                {
                    query += " WHERE Status = @Status";
                }

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                if (statusFilter != "All")
                {
                    da.SelectCommand.Parameters.AddWithValue("@Status", statusFilter);
                }

                DataTable dt = new DataTable();
                da.Fill(dt);
                gvDraftCampaigns.DataSource = dt;
                gvDraftCampaigns.DataBind();
            }
        }


        protected void ddlStatusFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedStatus = ddlStatusFilter.SelectedValue; // Get the selected status
            BindCampaignList(selectedStatus); // Pass the selected status to the method
        }

        protected void btnResend_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int sendID = int.Parse(btn.CommandArgument);

            UpdateCampaignStatus(sendID, "Pending");
            List<string> recipientEmails = GetRecipientEmails(sendID);
            string subject = "Resend Campaign Subject";
            string body = "Resend Campaign Body";

            try
            {
                SendEmails(recipientEmails, subject, body);
                UpdateCampaignStatus(sendID, "Success");
                lblmsg.Text = "Campaign resent successfully!";
            }
            catch (Exception ex)
            {
                UpdateCampaignStatus(sendID, "Failed");
                lblmsg.Text = $"Error resending campaign: {ex.Message}";
            }
        }

        private void UpdateCampaignStatus(int sendID, string status)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "UPDATE sendTemplate SET Status = @Status WHERE SendID = @SendID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Status", status);
                cmd.Parameters.AddWithValue("@SendID", sendID);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
        private List<string> GetRecipientEmails(int sendID)
        {
            // Replace this with actual logic to fetch recipient emails from the database
            return new List<string> { "recipient1@example.com", "recipient2@example.com" };
        }

        private void SendEmails(List<string> recipientEmails, string subject, string body)
        {
            // Implement email sending logic here
        }

        //private int GetCurrentSendID()
        //{
        //    return 0;
        //}

        protected void btnViewEmployees_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int sendID = int.Parse(btn.CommandArgument);
            Response.Redirect($"Employees Status.aspx?SendID={sendID}");
        }

    }
}