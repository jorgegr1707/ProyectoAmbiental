using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Aplicacion_Web
{
    public partial class Home : System.Web.UI.Page
    {
        public static bool blockBtn = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            /*if (blockBtn)
                btnMain.Enabled = false;*/ 

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            blockBtn = true;
            Response.Redirect("Home.aspx");
        }
    }
}