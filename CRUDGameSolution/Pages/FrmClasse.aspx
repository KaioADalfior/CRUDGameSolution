<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master"  CodeBehind="FrmClasse.aspx.cs" Inherits="CRUDGameSolution.Pages.FrmClasses" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <h1>Gerenciar Classes</h1>
        <div>
            <a href="Default.aspx">Início</a>
        </div>

        <fieldset>
            <legend>Criar Nova Classe</legend>

            <p>
                <label>Nome da Classe:</label>
                <asp:TextBox runat="server" id="txtDescricao" />
            </p>
            <p>
                <asp:Button Text="Cadastrar"
                    runat="server"
                    ID="btnConfirmar" OnClick="btnConfirmar_Click"/>
            </p>
            <p>
                <label id="lblMensagem" runat="server"></label>
            </p>
        </fieldset>

    <h2>Classes Cadastradas</h2>

        <table border="1">
            <tr>
                <th>Código</th>
                <th>Descrição</th>
                <th>Ações</th>
            </tr>

            <asp:ListView runat="server" ID="lvClasses">
                <ItemTemplate>
                    <tr>
                        <td>
                            <%# Eval("idClasse") %>
                        </td>
                        <td>
                            <%# Eval("Descricao") %>
                        </td>
                        <td>
                            <button>Visualizar</button>
                            <button>Editar</button>
                            <button>Excluir</button>
                        </td>
                    </tr>
                   
                </ItemTemplate>
            </asp:ListView>
        </table>

</asp:Content>
