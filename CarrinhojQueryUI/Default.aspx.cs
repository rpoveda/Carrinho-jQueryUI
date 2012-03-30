using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CarrinhojQueryUI.Class;
using System.Web.Services;
using System.Web.Script.Serialization;

namespace CarrinhojQueryUI
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rpProdutos.DataSource = ProdutoDAO.Produtos();
                rpProdutos.DataBind();

            }
        }

        private void populaCarrinho()
        {
            List<Produto> lstProduto = (List<Produto>)Session["produtos"];
            rpCarrinho.DataSource = lstProduto;
            rpCarrinho.DataBind();
        }

        public void teste() { lbl.Text = "Oi"; }


        [WebMethod]
        public static String AddCarrinho(string codigo)
        {
            JavaScriptSerializer js = new JavaScriptSerializer();
            List<Produto> lstProduto = null;
            if (HttpContext.Current.Session["produtos"] != null)
            {
                lstProduto = (List<Produto>)HttpContext.Current.Session["produtos"];
            }
            else {
                lstProduto = new List<Produto>();
            }

            var achaProduto = lstProduto.Find(p => p.Codigo == Convert.ToDecimal(codigo));
            if (achaProduto != null)
            {
                lstProduto.Remove(achaProduto);
                achaProduto.Qnt++;
                lstProduto.Add(achaProduto);
            }
            else
            {
                Produto p = new Produto() { Codigo = Convert.ToDecimal(codigo), Qnt = 1 };
                lstProduto.Add(p);
            }
            HttpContext.Current.Session["produtos"] = lstProduto;
            var teste = js.Serialize(lstProduto);
            return teste.ToString();
        }

    }
}
