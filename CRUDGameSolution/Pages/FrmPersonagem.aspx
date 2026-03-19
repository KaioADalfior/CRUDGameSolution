<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmPersonagem.aspx.cs" MasterPageFile="~/Site.Master" Inherits="CRUDGameSolution.Pages.FrmPersonagem" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid" style="max-width: 860px;">

        <!-- CABEÇALHO -->
        <div class="page-header" style="border-color: #2a2a3e;">
            <h1 style="color: #c9a84c;">
                <span class="glyphicon glyphicon-knight"></span>Gerenciar Personagens
            </h1>
        </div>

        <a href="../Default.aspx" class="btn btn-sm" style="background-color: #1e1e2e; color: #c9a84c; border-color: #444;">
            <span class="glyphicon glyphicon-home"></span>Início
        </a>

        <br />
        <br />

        <!-- PAINEL PRINCIPAL -->
        <div class="panel" style="background-color: #1e1e2e; border-color: #c9a84c;">
            <div class="panel-heading" style="background-color: #c9a84c; border-color: #c9a84c;">
                <h3 class="panel-title" style="color: #1a1a2e; font-weight: bold;">
                    <span class="glyphicon glyphicon-plus-sign"></span>Criar novo personagem
                </h3>
            </div>
            <div class="panel-body">

                <!-- DADOS DO PERSONAGEM -->
                <div class="panel" style="background-color: #16162a; border-color: #333;">
                    <div class="panel-heading" style="background-color: #12121f; border-color: #333;">
                        <strong style="color: #c9a84c;">Dados do Personagem</strong>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="txtNome" style="color: #aaaaaa;">Nome</label>
                                    <asp:TextBox runat="server" ID="txtNome" CssClass="form-control" placeholder="Nome do personagem"
                                        Style="background-color: #12121f; color: #e0e0e0; border-color: #444;" />
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label for="txtNivel" style="color: #aaaaaa;">Nível</label>
                                    <asp:TextBox runat="server" ID="txtNivel" CssClass="form-control" placeholder="Ex: 1"
                                        Style="background-color: #12121f; color: #e0e0e0; border-color: #444;" />
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label for="txtSexo" style="color: #aaaaaa;">Sexo</label>
                                    <asp:TextBox runat="server" ID="txtSexo" CssClass="form-control" placeholder="M / F"
                                        Style="background-color: #12121f; color: #e0e0e0; border-color: #444;" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="ddlRaca" style="color: #aaaaaa;">Raça</label>
                                    <asp:DropDownList runat="server" ID="ddlRaca" CssClass="form-control"
                                        Style="background-color: #12121f; color: #e0e0e0; border-color: #444;" />
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label for="ddlClasse" style="color: #aaaaaa;">Classe</label>
                                    <asp:DropDownList runat="server" ID="ddlClasse" CssClass="form-control"
                                        AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlClasse_SelectedIndexChanged"
                                        Style="background-color: #12121f; color: #e0e0e0; border-color: #444;" />
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label for="ddlSubclasse" style="color: #aaaaaa;">Subclasse</label>
                                    <asp:DropDownList runat="server" ID="ddlSubclasse" CssClass="form-control"
                                        Style="background-color: #12121f; color: #e0e0e0; border-color: #444;" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- ATRIBUTOS -->
                <div class="panel" style="background-color: #16162a; border-color: #333;">
                    <div class="panel-heading" style="background-color: #12121f; border-color: #333;">
                        <strong style="color: #c9a84c;">
                            <span class="glyphicon glyphicon-stats"></span>Atributos
                        </strong>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="txtForca" style="color: #aaaaaa;">Força</label>
                                    <asp:TextBox runat="server" ID="txtForca" CssClass="form-control" placeholder="0–20"
                                        Style="background-color: #12121f; color: #e0e0e0; border-color: #444;" />
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="txtDestreza" style="color: #aaaaaa;">Destreza</label>
                                    <asp:TextBox runat="server" ID="txtDestreza" CssClass="form-control" placeholder="0–20"
                                        Style="background-color: #12121f; color: #e0e0e0; border-color: #444;" />
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="txtSabedoria" style="color: #aaaaaa;">Sabedoria</label>
                                    <asp:TextBox runat="server" ID="txtSabedoria" CssClass="form-control" placeholder="0–20"
                                        Style="background-color: #12121f; color: #e0e0e0; border-color: #444;" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="txtConstituicao" style="color: #aaaaaa;">Constituição</label>
                                    <asp:TextBox runat="server" ID="txtConstituicao" CssClass="form-control" placeholder="0–20"
                                        Style="background-color: #12121f; color: #e0e0e0; border-color: #444;" />
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="txtInteligencia" style="color: #aaaaaa;">Inteligência</label>
                                    <asp:TextBox runat="server" ID="txtInteligencia" CssClass="form-control" placeholder="0–20"
                                        Style="background-color: #12121f; color: #e0e0e0; border-color: #444;" />
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="txtCarisma" style="color: #aaaaaa;">Carisma</label>
                                    <asp:TextBox runat="server" ID="txtCarisma" CssClass="form-control" placeholder="0–20"
                                        Style="background-color: #12121f; color: #e0e0e0; border-color: #444;" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- APARÊNCIA -->
                <div class="panel" style="background-color: #16162a; border-color: #333;">
                    <div class="panel-heading" style="background-color: #12121f; border-color: #333;">
                        <strong style="color: #c9a84c;">
                            <span class="glyphicon glyphicon-user"></span>Aparência
                        </strong>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label for="txtPeso" style="color: #aaaaaa;">Peso (kg)</label>
                                    <asp:TextBox runat="server" ID="txtPeso" CssClass="form-control" placeholder="Ex: 70"
                                        Style="background-color: #12121f; color: #e0e0e0; border-color: #444;" />
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label for="txtAltura" style="color: #aaaaaa;">Altura (m)</label>
                                    <asp:TextBox runat="server" ID="txtAltura" CssClass="form-control" placeholder="Ex: 1.75"
                                        Style="background-color: #12121f; color: #e0e0e0; border-color: #444;" />
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label for="txtCorCabelo" style="color: #aaaaaa;">Cor do Cabelo</label>
                                    <asp:TextBox runat="server" ID="txtCorCabelo" CssClass="form-control" placeholder="Ex: Preto"
                                        Style="background-color: #12121f; color: #e0e0e0; border-color: #444;" />
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label for="txtEstiloCabelo" style="color: #aaaaaa;">Estilo do Cabelo</label>
                                    <asp:TextBox runat="server" ID="txtEstiloCabelo" CssClass="form-control" placeholder="Ex: Liso"
                                        Style="background-color: #12121f; color: #e0e0e0; border-color: #444;" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="txtCorOlho" style="color: #aaaaaa;">Cor dos Olhos</label>
                                    <asp:TextBox runat="server" ID="txtCorOlho" CssClass="form-control" placeholder="Ex: Azul"
                                        Style="background-color: #12121f; color: #e0e0e0; border-color: #444;" />
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="txtCorPele" style="color: #aaaaaa;">Cor da Pele</label>
                                    <asp:TextBox runat="server" ID="txtCorPele" CssClass="form-control" placeholder="Ex: Clara"
                                        Style="background-color: #12121f; color: #e0e0e0; border-color: #444;" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- BOTÃO -->
                <div class="row">
                    <div class="col-sm-12">
                        <asp:Button
                            runat="server"
                            ID="btnConfirmar"
                            Text="Cadastrar Personagem"
                            CssClass="btn btn-lg btn-block"
                            OnClick="btnConfirmar_Click"
                            Style="background-color: #c9a84c; color: #1a1a2e; font-weight: bold; border: none;" />
                    </div>
                </div>

                <br />

                <asp:Label runat="server" ID="lblMensagem" Style="display: block; color: #c9a84c;" />

            </div>
        </div>

    </div>

</asp:Content>
