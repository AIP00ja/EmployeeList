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
    public partial class WebForm6 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["myconstr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }
        void BindGridView()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = "SELECT EMP_ID, EMP_NAME, EMP_EMAILID, DEPARTMENT FROM EMPLOYEE";
                    SqlDataAdapter sda = new SqlDataAdapter(query, con);
                    DataTable data = new DataTable();
                    sda.Fill(data);

                    gvEmployees.DataSource = data;
                    gvEmployees.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading data: " + ex.Message;
                lblMessage.Visible = true;
            }
        }
        private List<int> GetSelectedEmployees()
        {
            List<int> selectedEmployees = new List<int>();
            foreach (GridViewRow row in gvEmployees.Rows)
            {
                CheckBox chkRow = (CheckBox)row.FindControl("ChkEmpty");
                if (chkRow != null && chkRow.Checked)
                {
                    int empId = Convert.ToInt32(gvEmployees.DataKeys[row.RowIndex].Value);
                    selectedEmployees.Add(empId);
                }
            }
            return selectedEmployees;
        }
        protected void btnProceed_Click(object sender, EventArgs e)
        {
            List<int> selectedEmployees = GetSelectedEmployees();

            if (selectedEmployees.Count > 0)
            {
                Session["SelectedEmployees"] = selectedEmployees;
                Response.Redirect("WebForm7.aspx");
            }
            else
            {
                lblMessage.Text = "Please select at least one employee.";
                lblMessage.Visible = true;
            }
        }

        protected void ChkHeader_CheckedChanged(object sender, EventArgs e)
        {

            CheckBox chkHeader = (CheckBox)gvEmployees.HeaderRow.FindControl("ChkHeader");
            foreach (GridViewRow row in gvEmployees.Rows)
            {
                CheckBox chkRow = (CheckBox)row.FindControl("ChkEmpty");
                if (chkRow != null)
                {
                    chkRow.Checked = chkHeader.Checked;
                }
            }
        }

        protected void btnProceedd_Click(object sender, EventArgs e)
        {
            List<int> selectedEmployees = GetSelectedEmployees();

            if (selectedEmployees.Count > 0)
            {
                Session["SelectedEmployees"] = selectedEmployees;
                Response.Redirect("WebForm7.aspx");
            }
            else
            {
                lblMessage.Text = "Please select at least one employee.";
                lblMessage.Visible = true;
            }
        }
        protected void gvEmployees_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvEmployees.PageIndex = e.NewPageIndex;
            BindGridView();
        }
    }
}