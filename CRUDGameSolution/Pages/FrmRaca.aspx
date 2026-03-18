<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmRaca.aspx.cs" MasterPageFile="~/Site.Master"  Inherits="CRUDGameSolution.Pages.FrmRaca" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <h1>Gerenciar Raças</h1>
        <div>
            <a href="Default.aspx">Início</a>
        </div>

        <fieldset>
            <legend>Criar Nova Raça
            </legend>

            <p>
                <label>Nome da Raça:</label>
                <asp:TextBox runat="server" id="txtDescricao" />
            </p>
            <p>
                <asp:Button Text="Cadastrar"
                    runat="server"
                    ID="btnConfirmar" />
            </p>
            <p>
                <label id="lblMensagem" runat="server"></label>
            </p>
        </fieldset>

</asp:Content>


