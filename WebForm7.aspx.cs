using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;

namespace Newsletter
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["myconstr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindLayouts(); 
                BindRecipientCount(); 
            }
        }

        private void BindLayouts()
        {
            using (SqlConnection conn = new SqlConnection(cs))
            {
                string query = "SELECT TemplateID, LayoutName, Thumbnail FROM Templates";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                dropLayout.DataSource = dt;
                dropLayout.DataTextField = "LayoutName";
                dropLayout.DataValueField = "TemplateID";
                dropLayout.DataBind();
                dropLayout.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Select Layout --", "0"));
            }
        }

        private void BindRecipientCount()
        {
            if (Session["SelectedEmployees"] != null)
            {
                List<int> selectedEmployees = (List<int>)Session["SelectedEmployees"];
                txtRecipients.Text = selectedEmployees.Count.ToString();
            }
            else
            {
                txtRecipients.Text = "0";
            }
        }
        protected void btnDraft_Click(object sender, EventArgs e)
        {
            try
            {
                
                if (string.IsNullOrWhiteSpace(txtCompaign.Text))
                {
                    lblmsg.Text = "Please enter a campaign name.";
                    lblmsg.CssClass = "text-danger";
                    return;
                }

                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = "INSERT INTO sendTemplate (Recipients, Layout, SenderEmail, CreatedDate, CampaignName, IsDraft, Status) " +
                                   "VALUES (@Recipients, @Layout, @SenderEmail, @CreatedDate, @CampaignName, @IsDraft, @Status)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Recipients", txtRecipients.Text);
                    cmd.Parameters.AddWithValue("@Layout", dropLayout.SelectedValue);
                    cmd.Parameters.AddWithValue("@SenderEmail", dropEmail.SelectedValue);
                    cmd.Parameters.AddWithValue("@CampaignName", txtCompaign.Text);
                    cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
                    cmd.Parameters.AddWithValue("@IsDraft", true); 
                    cmd.Parameters.AddWithValue("@Status", "Draft"); 

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                lblmsg.Text = "Campaign saved as draft successfully!";
                lblmsg.CssClass = "text-success";
            }
            catch (Exception ex)
            {
                lblmsg.Text = $"Error: {ex.Message}";
                lblmsg.CssClass = "text-danger";
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                int templateID = int.Parse(dropLayout.SelectedValue);
                if (templateID == 0)
                {
                    lblmsg.Text = "Please select a layout.";
                    lblmsg.CssClass = "text-danger";
                    return;
                }

                string emailSubject = "";
                string emailBody = "";
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    string query = "SELECT EmailTitle, ContentHTML FROM Templates WHERE TemplateID = @TemplateID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@TemplateID", templateID);

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        emailSubject = reader["EmailTitle"].ToString();
                        emailBody = reader["ContentHTML"].ToString();
                    }
                }

                if (string.IsNullOrEmpty(emailBody))
                {
                    lblmsg.Text = "The selected layout does not have email content.";
                    lblmsg.CssClass = "text-danger";
                    return;
                }

                List<string> recipientEmails = GetRecipientEmails();
                if (recipientEmails.Count == 0)
                {
                    lblmsg.Text = "No recipients found.";
                    lblmsg.CssClass = "text-danger";
                    return;
                }

                
                UpdateStatus("Pending");

                
                SendEmails(recipientEmails, emailSubject, emailBody);

                
                UpdateStatus("Success");

                lblmsg.Text = "Emails sent successfully!";
                lblmsg.CssClass = "text-success";
            }
            catch (Exception ex)
            {
                UpdateStatus("Failed");

                lblmsg.Text = $"Error: {ex.Message}";
                lblmsg.CssClass = "text-danger";
            }
        }
        private void UpdateStatus(string status)
        {
            int sendID = GetCurrentSendID(); 
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
        private int GetCurrentSendID()
        {
            
            return 1; 
        }
        void Sendtemplate() {
            SqlConnection con = new SqlConnection(cs);
            string query = "insert into sendTemplate values (@Recipients, @Layout, @SenderEmail, @CreatedDate, @CampaignName, @IsDraft)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Recipients", txtRecipients.Text);
            cmd.Parameters.AddWithValue("@Layout", dropLayout.SelectedValue);
            cmd.Parameters.AddWithValue("@SenderEmail", dropEmail.SelectedValue);
            cmd.Parameters.AddWithValue("@CampaignName", txtCompaign.Text);
            cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
            cmd.Parameters.AddWithValue("@IsDraft", false);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        private List<string> GetRecipientEmails()
        {
            List<string> recipientEmails = new List<string>();
            if (Session["SelectedEmployees"] != null)
            {
                List<int> selectedEmployees = (List<int>)Session["SelectedEmployees"];
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    string query = "SELECT EMP_EMAILID FROM EMPLOYEE WHERE EMP_ID IN (" + string.Join(",", selectedEmployees) + ")";
                    SqlCommand cmd = new SqlCommand(query, conn);

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        recipientEmails.Add(reader["EMP_EMAILID"].ToString());
                    }
                }
            }
            return recipientEmails; 
        }

        private void SendEmails(List<string> recipientEmails, string subject, string body)
        {
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587)
            {
                Credentials = new System.Net.NetworkCredential("taskt4638@gmail.com", "kzex tzoj hnsm acuk"),
                EnableSsl = true
            };
            foreach (string recipientEmail in recipientEmails)
            {
                MailMessage mail = new MailMessage
                {
                    From = new MailAddress("taskt4638@gmail.com"),
                    Subject = subject,
                    Body = body,
                    IsBodyHtml = true
                };
                mail.To.Add(recipientEmail);

                client.Send(mail);
            }
        }

        protected void dropLayout_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedTemplateID = int.Parse(dropLayout.SelectedValue);
            if (selectedTemplateID == 0)
            {
                ImageThumbnail.ImageUrl = "~/Image/JLR-Logo.png"; 
                return;
            }

            using (SqlConnection conn = new SqlConnection(cs))
            {
                string query = "SELECT Thumbnail FROM Templates WHERE TemplateID = @TemplateID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@TemplateID", selectedTemplateID);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    string thumbnail = reader["Thumbnail"].ToString();
                    ImageThumbnail.ImageUrl = !string.IsNullOrEmpty(thumbnail) ? ResolveUrl(thumbnail) : "~/Image/JLR-Logo.png";
                }
                else
                {
                    ImageThumbnail.ImageUrl = "~/Image/JLR-Logo.png"; 
                }
            }

        }
    }
}
