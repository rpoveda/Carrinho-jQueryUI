<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="CarrinhojQueryUI._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <link href="Styles/Personal.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.2/jquery-ui.min.js"></script>
    <script type="text/javascript">
        $(function () {

            $('#conteudo-produtos .produto').draggable({
                helper: 'clone',
                start: function () {
                }
            });

            $('#carrinho').droppable({
                drop: function (event, ui) {
                    var cod = ui.draggable.find('.codigo').val();

                    $.ajax({
                        type: "POST",
                        url: "Default.aspx/AddCarrinho",
                        data: "{codigo: '" + cod + "'}",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            $('.retorno').empty();
                            $('.retorno').append(data.d);
                        },
                        error: function (data) {
                            alert(data.d);
                        }
                    });

                }
            });

        });
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Bem Vindo ao Carrinho jQuery UI
    </h2>
    <%--    <div id="conteudo-produtos">
        <div class="produto">
            <p>
                Barra de Chocolate</p>
            <img src="Img/chocolate.jpg" />
            <input type="text" class="qnt" />
        </div>
        <div class="produto">
            <p>
                Bombom Trufado</p>
            <img src="Img/trufa-chocolate.jpg" />
            <input type="text" class="qnt" />
        </div>
        <div class="produto">
            <p>
                Ovo de pascoa</p>
            <img src="Img/ovos+de+pascoa+trufado+sao+paulo+sp+brasil__29D00D_5.jpg" />
            <input type="text" class="qnt" />
        </div>
    </div>--%>
    <div id="conteudo-produtos">
        <asp:Repeater ID="rpProdutos" runat="server">
            <ItemTemplate>
                <div class="produto">
                    <input type="hidden" class="codigo" value='<%# DataBinder.Eval(Container.DataItem, "Codigo")%>' />
                    <p><%# DataBinder.Eval(Container.DataItem, "Nome")%></p>
                    <p>Preço: <%# DataBinder.Eval(Container.DataItem, "Valor")%></p>
                    <img src='Img/<%# DataBinder.Eval(Container.DataItem, "Img")%>' />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <div id="carrinho">
        <ul class="lst-carrinho">
            <asp:Repeater ID="rpCarrinho" runat="server">
                <ItemTemplate>
                    <li>
                        <div class="conteudo-carrinho">
                            <p>Produto <%# DataBinder.Eval(Container.DataItem, "Nome")%></p>
                            <p>Quantidade: <%# DataBinder.Eval(Container.DataItem, "Qtd")%> - Valor: <%# DataBinder.Eval(Container.DataItem, "Valor")%></p>
                        </div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
    <asp:Label runat="server" ID="lbl" CssClass="retorno"></asp:Label>
</asp:Content>
