<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmHabilidade.aspx.cs" MasterPageFile="~/Site.Master" Inherits="CRUDGameSolution.Pages.FrmHabilidade" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <h1>Gerenciar Habilidades</h1>
        <div>
            <a href="Default.aspx">Início</a>
        </div>

        <fieldset>
            <legend>Criar Nova Habilidade</legend>

            <p>
                <label>Nome da Habilidade:</label>
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

    <h2>Habilidades Cadastradas</h2>

        <table border="1">
            <tr>
                <th>Código</th>
                <th>Descrição</th>
                <th>Ações</th>
            </tr>

            <asp:ListView runat="server" ID="lvHabilidades">
                <ItemTemplate>
                    <tr>
                        <td>
                            <%# Eval("idHabilidade") %>
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
