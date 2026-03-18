<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmSubclasse.aspx.cs" MasterPageFile="~/Site.Master" Inherits="CRUDGameSolution.Pages.FrmSubclasse" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <h1>Gerenciar Subclasses</h1>
    <div>
        <a href="Default.aspx">Início</a>
    </div>

    <fieldset>
        <legend>Criar Nova Subclasse</legend>

        <p>
            <label>Nome da Subclasse:</label>
            <asp:TextBox runat="server" ID="txtDescricao" />
        </p>

        <p>
            <label>Selecione uma classe: </label>
            <asp:DropDownList runat="server" ID="DDLClasse">
            </asp:DropDownList>
        </p>

        <p>
            <asp:Button Text="Cadastrar"
                runat="server"
                ID="btnConfirmar" OnClick="btnConfirmar_Click" />
        </p>
        <p>
            <label id="lblMensagem" runat="server"></label>
        </p>
    </fieldset>

    <h2>Subclasses Cadastradas</h2>

    <table border="1">
        <tr>
            <th>Código</th>
            <th>Descrição</th>
            <th>Classe</th>
            <th>Ações</th>
        </tr>

        <asp:ListView runat="server" ID="lvSubclasses">
            <ItemTemplate>
                <tr>
                    <td>
                        <%# Eval("idSubclasse") %>
                    </td>
                    <td>
                        <%# Eval("Descricao") %>
                    </td>

                    <td>
                        <%# Eval("Classes.Descricao") %>
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
