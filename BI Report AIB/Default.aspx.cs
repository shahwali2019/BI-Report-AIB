using System;
using System.Collections.Generic;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BI_Report_AIB
{
    public partial class _Default : Page
    {
        //        string OracleCon = "Data Source=(DESCRIPTION =" +
        //"(ADDRESS = (PROTOCOL = TCP)(HOST = 10.178.0.132)(PORT = 1521))" +
        //"(CONNECT_DATA =" +
        //"(SERVER = DEDICATED)" +
        //"(SERVICE_NAME = aibuat.testdbsubnet.aibmumvcn.oraclevcn.com)));" +
        //"User Id=AIBUATR2_READ;Password=AIBUATR2_READ;";


        string OracleCon = "Data Source=(DESCRIPTION =" +
"(ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.0.56)(PORT = 1521))" +
"(CONNECT_DATA =" +
"(SERVER = DEDICATED)" +
"(SERVICE_NAME = AIBLIVE)));" +
"User Id=appuser;Password=Z__M098765;";
        //"User Id=shahak;Password=Angular@#2021;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }


            protected void Button1_Click(object sender, EventArgs e)
        {

            string strValue = Request.Form["ctl00$MainContent$BI22PDF"];

            //Response.Write(strValue);


            OracleConnection con = new OracleConnection(OracleCon);
            OracleCommand cmd = new OracleCommand();
            // sttm_customer - nationality
            cmd.CommandText = "SELECT c.customer_name1, c.nationality, ac.cust_ac_no, ac.ccy, TO_CHAR(cp.date_of_birth, 'mm/dd/yyyy') dob, cp.place_of_birth " +
                              "FROM fccprod.sttm_cust_account ac, fccprod.sttm_customer c, fccprod.sttm_cust_personal cp " +
                              //"FROM fccprod.sttm_cust_account ac, fccprod.sttm_customer c, fccprod.sttm_cust_personal cp " +
                              "WHERE ac.cust_no = c.customer_no AND ac.cust_no = cp.customer_no AND c.customer_type = 'I' "+
                              "AND ac.cust_ac_no = '" + strValue + "'";
            cmd.Connection = con;
            con.Open();
            OracleDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                //Response.Write("<table border='1'>");
                //Response.Write("<tr><th><% BI22PDF %></th><th>Customer</th></tr>");
                while (dr.Read())
                {

                    //Response.Write("<tr>");
                    //Response.Write("<td>" + dr["ac_desc"].ToString() + "</td>");
                    //Response.Write("<td>" + dr["BI22PDF"].ToString() + "</td>");
                    BI5PDF.Text = dr["customer_name1"].ToString();
                    BI12PDF.Text = dr["nationality"].ToString();
                    BI6PDF.Text = dr["cust_ac_no"].ToString();
                    BI2PDF.Text = dr["ccy"].ToString();
                    BI10PDF.Text = dr["dob"].ToString();
                    BI11PDF.Text = dr["place_of_birth"].ToString();
                    //Response.Write("</tr>");
                }

                txtlbl1.Visible = true;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel1();", true);
            }
            else  
            {
                //Response.Write("No Data In DataBase");
                //txtlbl.Text = "No Data In DataBase";
                txtlbl.Visible = true;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            }
            con.Close();
        }
    }
}