﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Net;
using static System.Net.WebRequestMethods;

namespace Newsletter
{
    public partial class ForgotPass : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["myconstr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submitbtn_Click(object sender, EventArgs e)
        {
            try
            {
                string email = txtemail.Text.Trim();
                if (string.IsNullOrEmpty(email))
                {
                    lblmsg.Text = "Please enter your email.";
                    lblmsg.CssClass = "text-danger";
                    return;
                }

                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Check if email exists in the database
                    SqlCommand cmd = new SqlCommand("SELECT ID, NAME FROM REGISTER WHERE EMAIL = @Email", con);
                    cmd.Parameters.AddWithValue("@Email", email);
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.HasRows)
                    {
                        dr.Read();
                        int userId = Convert.ToInt32(dr["ID"]);
                        string userName = dr["NAME"].ToString();
                        dr.Close();

                        // Generate a secure token (GUID)
                        string token = Guid.NewGuid().ToString();

                        // Store the token in the database with an expiration timestamp (1 hour from now)
                        SqlCommand insertCmd = new SqlCommand("UPDATE REGISTER SET ResetToken = @Token, TokenExpiry = @Expiry WHERE ID = @UserId", con);
                        insertCmd.Parameters.AddWithValue("@Token", token);
                        insertCmd.Parameters.AddWithValue("@Expiry", DateTime.Now.AddMinutes(3)); // Token valid for 1 hour
                        insertCmd.Parameters.AddWithValue("@UserId", userId);
                        insertCmd.ExecuteNonQuery();

                        // Construct the reset link
                        string resetLink = $"https://localhost:44308/ResetPass.aspx?token={token}";

                        // Create and send the email with the reset link
                        SmtpClient client = new SmtpClient("smtp.gmail.com", 587)
                        {
                            Credentials = new NetworkCredential("taskt4638@gmail.com", "kzex tzoj hnsm acuk"),
                            EnableSsl = true
                        };

                        MailMessage mail = new MailMessage
                        {
                            From = new MailAddress("taskt4638@gmail.com"),
                            Subject = "Password Reset Link",
                            Body = $"Dear {userName},<br/><br/>" +
                                   $"Click the following link to reset your password: <a href='{resetLink}'>Reset Password</a><br/><br/>" +
                                   "If you did not request this, please ignore this email.",
                            IsBodyHtml = true

                        };

                        mail.To.Add(email);
                        client.Send(mail);

                        lblmsg.Text = "Password reset link has been sent to your email.";
                        lblmsg.CssClass = "text-success";

                        // Hide the form after the email has been sent
                        formPanel.Visible = false;
                    }
                    else
                    {
                        lblmsg.Text = "Email not found.";
                        lblmsg.CssClass = "text-danger";
                    }
                }
            }
            catch (Exception ex)
            {
                lblmsg.Text = $"Error: {ex.Message}";
                lblmsg.CssClass = "text-danger";
            }
        }
    }
}