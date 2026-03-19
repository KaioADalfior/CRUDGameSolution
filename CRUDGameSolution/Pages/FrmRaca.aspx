<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmRaca.aspx.cs" MasterPageFile="~/Site.Master"  Inherits="CRUDGameSolution.Pages.FrmRaca" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid" style="max-width: 860px;">

        <!-- CABEÇALHO -->
        <div class="page-header" style="border-color:#2a2a3e;">
            <h1 style="color:#c9a84c;">
                <span class="glyphicon glyphicon-globe"></span> Gerenciar Raças
            </h1>
        </div>

        <a href="../Default.aspx" class="btn btn-sm" style="background-color:#1e1e2e; color:#c9a84c; border-color:#444;">
            <span class="glyphicon glyphicon-home"></span> Início
        </a>

        <br /><br />

        <!-- FORMULÁRIO -->
        <div class="panel" style="background-color:#1e1e2e; border-color:#c9a84c;">
            <div class="panel-heading" style="background-color:#c9a84c; border-color:#c9a84c;">
                <h3 class="panel-title" style="color:#1a1a2e; font-weight:bold;">
                    <span class="glyphicon glyphicon-plus-sign"></span> Criar Nova Raça
                </h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-sm-8">
                        <div class="form-group">
                            <label for="txtDescricao" style="color:#aaaaaa;">Nome da Raça</label>
                            <asp:TextBox
                                runat="server"
                                ID="txtDescricao"
                                CssClass="form-control"
                                placeholder="Ex: Elfo, Anão, Humano..."
                                style="background-color:#12121f; color:#e0e0e0; border-color:#444;" />
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label style="color:transparent;">.</label><br />
                            <asp:Button
                                Text="Cadastrar"
                                runat="server"
                                ID="btnConfirmar"
                                OnClick="btnConfirmar_Click"
                                CssClass="btn btn-block"
                                style="background-color:#c9a84c; color:#1a1a2e; font-weight:bold; border:none;" />
                        </div>
                    </div>
                </div>
                <label id="lblMensagem" runat="server" style="color:#c9a84c;"></label>
            </div>
        </div>

        <!-- TABELA -->
        <div class="panel" style="background-color:#1e1e2e; border-color:#333;">
            <div class="panel-heading" style="background-color:#16162a; border-color:#333;">
                <h3 class="panel-title" style="color:#c9a84c;">
                    <span class="glyphicon glyphicon-list"></span> Raças Cadastradas
                </h3>
            </div>
            <div class="panel-body" style="padding:0;">
                <table class="table table-hover" style="margin:0; background-color:#1e1e2e; color:#cccccc;">
                    <thead>
                        <tr style="background-color:#16162a; color:#c9a84c;">
                            <th style="width:80px; border-color:#333; color:#c9a84c;">Código</th>
                            <th style="border-color:#333; color:#c9a84c;">Descrição</th>
                            <th style="width:220px; border-color:#333; color:#c9a84c;">Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:ListView runat="server" ID="lvRacas">
                            <ItemTemplate>
                                <tr style="border-color:#2a2a3e;">
                                    <td style="border-color:#2a2a3e; color:#aaaaaa;"><%# Eval("idRaca") %></td>
                                    <td style="border-color:#2a2a3e; color:#e0e0e0;"><%# Eval("Descricao") %></td>
                                    <td style="border-color:#2a2a3e;">
                                        <button class="btn btn-xs" style="background-color:#1a3a4a; color:#5bc0de; border-color:#2a5a6a;">
                                            <span class="glyphicon glyphicon-eye-open"></span> Visualizar
                                        </button>
                                        <button class="btn btn-xs" style="background-color:#3a2e00; color:#c9a84c; border-color:#5a4a00;">
                                            <span class="glyphicon glyphicon-pencil"></span> Editar
                                        </button>
                                        <button class="btn btn-xs" style="background-color:#3a1a1a; color:#e05c5c; border-color:#5a2a2a;">
                                            <span class="glyphicon glyphicon-trash"></span> Excluir
                                        </button>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <tr>
                                    <td colspan="3" class="text-center" style="padding:20px; color:#555; border-color:#2a2a3e;">
                                        <span class="glyphicon glyphicon-info-sign"></span> Nenhuma raça cadastrada ainda.
                                    </td>
                                </tr>
                            </EmptyDataTemplate>
                        </asp:ListView>
                    </tbody>
                </table>
            </div>
        </div>

    </div>

    <!-- Hover escuro na tabela -->
    <style>
        .table-hover > tbody > tr:hover > td {
            background-color: #16162a !important;
        }
    </style>

</asp:Content>