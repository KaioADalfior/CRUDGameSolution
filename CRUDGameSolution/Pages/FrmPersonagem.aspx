<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmPersonagem.aspx.cs" MasterPageFile="~/Site.Master" Inherits="CRUDGameSolution.Pages.FrmPersonagem" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid" style="max-width: 860px;">

        <!-- CABEÇALHO -->
        <div class="page-header">
            <h1><span class="glyphicon glyphicon-knight" aria-hidden="true"></span>Gerenciar Personagens</h1>
        </div>

        <a href="Default.aspx" class="btn btn-default btn-sm">
            <span class="glyphicon glyphicon-home"></span>Início
        </a>

        <br />
        <br />

        <!-- PAINEL PRINCIPAL -->
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">
                    <span class="glyphicon glyphicon-plus-sign"></span>Criar novo personagem
                </h3>
            </div>
            <div class="panel-body">

                <!-- DADOS DO PERSONAGEM -->
                <div class="panel panel-default">
                    <div class="panel-heading"><strong>Dados do Personagem</strong></div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="txtNome">Nome</label>
                                    <asp:TextBox runat="server" ID="txtNome" CssClass="form-control" placeholder="Nome do personagem" />
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label for="txtNivel">Nível</label>
                                    <asp:TextBox runat="server" ID="txtNivel" CssClass="form-control" placeholder="Ex: 1" />
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label for="txtSexo">Sexo</label>
                                    <asp:TextBox runat="server" ID="txtSexo" CssClass="form-control" placeholder="M / F" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="ddlRaca">Raça</label>
                                    <asp:DropDownList runat="server" ID="ddlRaca" CssClass="form-control" />
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="ddlSubclasse">Subclasse</label>
                                    <asp:DropDownList runat="server" ID="ddlSubclasse" CssClass="form-control" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- ATRIBUTOS -->
                <div class="panel panel-default">
                    <div class="panel-heading"><strong><span class="glyphicon glyphicon-stats"></span>Atributos</strong></div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="txtForca">Força</label>
                                    <asp:TextBox runat="server" ID="txtForca" CssClass="form-control" placeholder="0–20" />
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="txtDestreza">Destreza</label>
                                    <asp:TextBox runat="server" ID="txtDestreza" CssClass="form-control" placeholder="0–20" />
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="txtSabedoria">Sabedoria</label>
                                    <asp:TextBox runat="server" ID="txtSabedoria" CssClass="form-control" placeholder="0–20" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="txtConstituicao">Constituição</label>
                                    <asp:TextBox runat="server" ID="txtConstituicao" CssClass="form-control" placeholder="0–20" />
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="txtInteligencia">Inteligência</label>
                                    <asp:TextBox runat="server" ID="txtInteligencia" CssClass="form-control" placeholder="0–20" />
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="txtCarisma">Carisma</label>
                                    <asp:TextBox runat="server" ID="txtCarisma" CssClass="form-control" placeholder="0–20" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- APARÊNCIA -->
                <div class="panel panel-default">
                    <div class="panel-heading"><strong><span class="glyphicon glyphicon-user"></span>Aparência</strong></div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label for="txtPeso">Peso (kg)</label>
                                    <asp:TextBox runat="server" ID="txtPeso" CssClass="form-control" placeholder="Ex: 70" />
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label for="txtAltura">Altura (m)</label>
                                    <asp:TextBox runat="server" ID="txtAltura" CssClass="form-control" placeholder="Ex: 1.75" />
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label for="txtCorCabelo">Cor do Cabelo</label>
                                    <asp:TextBox runat="server" ID="txtCorCabelo" CssClass="form-control" placeholder="Ex: Preto" />
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label for="txtEstiloCabelo">Estilo do Cabelo</label>
                                    <asp:TextBox runat="server" ID="txtEstiloCabelo" CssClass="form-control" placeholder="Ex: Liso" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="txtCorOlho">Cor dos Olhos</label>
                                    <asp:TextBox runat="server" ID="txtCorOlho" CssClass="form-control" placeholder="Ex: Azul" />
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="txtCorPele">Cor da Pele</label>
                                    <asp:TextBox runat="server" ID="txtCorPele" CssClass="form-control" placeholder="Ex: Clara" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12">
                        <asp:Button
                            runat="server"
                            ID="btnConfirmar"
                            Text="Cadastrar Personagem"
                            CssClass="btn btn-success btn-lg" 
                            OnClick="btnConfirmar_Click"/>
                    </div>
                </div>

                <br />

                <asp:Label runat="server" ID="lblMensagem" CssClass="alert alert-info" Style="display: block;" />

            </div>
        </div>

    </div>

</asp:Content>
