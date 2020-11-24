using System;

namespace WebApplication5
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ContactPanel.Visible = false;
            AcademicPanel.Visible = false;
            BasketballPanel.Visible = false;
            CommentsPanel.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            AcademicPanel.Visible = true;
            GridView2.DataBind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            ContactPanel.Visible = true;
            GridView1.DataBind();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            BasketballPanel.Visible = true;
            GridView3.DataBind();
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            CommentsPanel.Visible = true;
            GridView4.DataBind();
        }

    }
}