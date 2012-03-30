using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CarrinhojQueryUI.Class
{
    public class Produto
    {

        public virtual decimal Codigo { get; set; }
        public virtual string Nome { get; set; }
        public virtual decimal Valor { get; set; }
        public virtual decimal Qnt { get; set; }
        public virtual string Img { get; set; }

    }

    public static partial class ProdutoDAO
    {
        public static List<Produto> Produtos()
        {
            List<Produto> lstProdutos = new List<Produto>();
            lstProdutos.Add(new Produto() { Codigo = 1, Nome = "Barra de chocolate", Valor = 20, Img = "chocolate.jpg" });
            lstProdutos.Add(new Produto() { Codigo = 2, Nome = "Bombom trufado", Valor = Convert.ToDecimal(1.50), Img = "trufa-chocolate.jpg" });
            lstProdutos.Add(new Produto() { Codigo = 3, Nome = "Ovo de pascoa", Valor = Convert.ToDecimal(25.99), Img = "ovos+de+pascoa+trufado+sao+paulo+sp+brasil__29D00D_5.jpg" });
            return lstProdutos;
        }
    }
}