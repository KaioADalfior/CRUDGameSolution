<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmPersonagem.aspx.cs" MasterPageFile="~/Site.Master" Inherits="CRUDGameSolution.Pages.FrmPersonagem" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .rpg-card {
            position: relative;
            background-color: #1e1e2e;
            border: 1px solid #c9a84c33;
            border-radius: 6px;
            padding: 28px;
            margin-bottom: 20px;
        }
        .rpg-card::before, .rpg-card::after {
            content: '';
            position: absolute;
            width: 40px; height: 40px;
            border-color: #c9a84c44;
            border-style: solid;
        }
        .rpg-card::before { top: 8px;    left: 8px;    border-width: 1px 0 0 1px; }
        .rpg-card::after  { bottom: 8px; right: 8px;   border-width: 0 1px 1px 0; }

        /* Seção interna (sub-card) */
        .rpg-section {
            background-color: #13131f;
            border: 1px solid #1e1e30;
            border-radius: 4px;
            padding: 22px 22px 10px;
            margin-bottom: 18px;
        }

        .rpg-section-title {
            font-family: 'Cinzel', serif;
            font-size: 11px;
            letter-spacing: 3px;
            text-transform: uppercase;
            color: #c9a84c;
            border-bottom: 1px solid #c9a84c1a;
            padding-bottom: 9px;
            margin-bottom: 20px;
        }
        .rpg-page-title {
            font-family: 'Cinzel', serif;
            font-size: 28px;
            font-weight: 900;
            color: #c9a84c;
            letter-spacing: 4px;
            text-shadow: 0 0 30px rgba(201,168,76,0.3);
            margin-bottom: 4px;
        }
        .rpg-page-subtitle {
            font-family: 'Crimson Text', serif;
            font-style: italic;
            color: #555;
            font-size: 15px;
            letter-spacing: 1px;
            margin-bottom: 24px;
        }
        .rpg-page-divider {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 22px;
        }
        .rpg-page-divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background: linear-gradient(90deg, #c9a84c33, transparent);
        }
        .rpg-page-divider span { color: #c9a84c66; font-size: 14px; }

        .rpg-btn-back {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: transparent;
            color: #777;
            font-family: 'Cinzel', serif;
            font-size: 11px;
            letter-spacing: 2px;
            text-transform: uppercase;
            border: 1px solid #2a2a3e;
            border-radius: 4px;
            padding: 7px 16px;
            text-decoration: none !important;
            transition: all .2s;
            margin-bottom: 24px;
        }
        .rpg-btn-back:hover {
            color: #c9a84c;
            border-color: #c9a84c44;
            background: rgba(201,168,76,0.04);
        }

        .rpg-label {
            font-family: 'Cinzel', serif;
            font-size: 10px;
            letter-spacing: 2px;
            text-transform: uppercase;
            color: #666;
            display: block;
            margin-bottom: 7px;
        }

        .rpg-input, .rpg-select {
            width: 100%;
            background-color: #0a0a16 !important;
            color: #e0e0e0 !important;
            border: 1px solid #2e2e42 !important;
            border-radius: 4px;
            padding: 10px 14px;
            font-family: 'Crimson Text', serif;
            font-size: 16px;
            transition: border-color .2s, box-shadow .2s;
        }
        .rpg-input:focus, .rpg-select:focus {
            border-color: #c9a84c !important;
            box-shadow: 0 0 0 3px rgba(201,168,76,0.1) !important;
            outline: none !important;
        }
        .rpg-input::placeholder { color: #3a3a52; }
        .rpg-select option { background-color: #0a0a16; color: #e0e0e0; }

        /* Badge de atributo — número destacado */
        .attr-group {
            position: relative;
        }
        .attr-group .rpg-input {
            text-align: center;
            font-family: 'Cinzel', serif;
            font-size: 18px;
            font-weight: 700;
            color: #c9a84c !important;
            letter-spacing: 1px;
            padding: 12px 10px;
        }
        .attr-group .rpg-input::placeholder {
            color: #2e2e42;
            font-size: 13px;
            font-weight: 400;
        }

        /* Botão submit grande */
        .rpg-btn-submit {
            width: 100%;
            background-color: #c9a84c;
            color: #0d0d1a;
            font-family: 'Cinzel', serif;
            font-size: 13px;
            font-weight: 700;
            letter-spacing: 3px;
            text-transform: uppercase;
            border: none;
            border-radius: 4px;
            padding: 15px 20px;
            cursor: pointer;
            transition: all .25s;
            display: block;
            margin-top: 6px;
        }
        .rpg-btn-submit:hover {
            background-color: #e8c96a;
            box-shadow: 0 0 28px rgba(201,168,76,0.45);
            transform: translateY(-2px);
        }
        .rpg-btn-submit:active { transform: translateY(0); }

        .rpg-msg {
            font-family: 'Crimson Text', serif;
            font-style: italic;
            font-size: 15px;
            color: #c9a84c;
            display: block;
            margin-top: 14px;
            min-height: 20px;
            text-align: center;
        }

        /* Grid de atributos */
        .attr-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 16px;
        }
        @media (max-width: 600px) {
            .attr-grid { grid-template-columns: repeat(2, 1fr); }
        }

        .form-group { margin-bottom: 16px; }
    </style>

    <div style="max-width: 860px; margin: 0 auto;">

        <%-- Cabeçalho --%>
        <div class="rpg-page-title">⚔ Criar Personagem</div>
        <p class="rpg-page-subtitle">Forje sua lenda — cada detalhe define seu destino</p>
        <div class="rpg-page-divider"><span>✦</span></div>

        <%-- Voltar --%>
        <a href="../Default.aspx" class="rpg-btn-back">← Início</a>

        <%-- Card principal --%>
        <div class="rpg-card">
            <div class="rpg-section-title">✦ Novo Personagem</div>

            <%-- ── Dados Gerais ── --%>
            <div class="rpg-section">
                <div class="rpg-section-title">🧝 Dados do Personagem</div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="rpg-label">Nome</label>
                            <asp:TextBox runat="server" ID="txtNome" CssClass="rpg-input"
                                placeholder="Nome do personagem" />
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label class="rpg-label">Nível</label>
                            <asp:TextBox runat="server" ID="txtNivel" CssClass="rpg-input attr-group"
                                placeholder="1" />
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label class="rpg-label">Sexo</label>
                            <asp:TextBox runat="server" ID="txtSexo" CssClass="rpg-input"
                                placeholder="M / F" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label class="rpg-label">Raça</label>
                            <asp:DropDownList runat="server" ID="ddlRaca" CssClass="rpg-select" />
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label class="rpg-label">Classe</label>
                            <asp:DropDownList runat="server" ID="ddlClasse" CssClass="rpg-select"
                                AutoPostBack="true"
                                OnSelectedIndexChanged="ddlClasse_SelectedIndexChanged" />
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label class="rpg-label">Subclasse</label>
                            <asp:DropDownList runat="server" ID="ddlSubclasse" CssClass="rpg-select" />
                        </div>
                    </div>
                </div>
            </div>

            <%-- ── Atributos ── --%>
            <div class="rpg-section">
                <div class="rpg-section-title">⚡ Atributos</div>
                <div class="attr-grid">
                    <div class="form-group attr-group">
                        <label class="rpg-label">Força</label>
                        <asp:TextBox runat="server" ID="txtForca" CssClass="rpg-input" placeholder="—" />
                    </div>
                    <div class="form-group attr-group">
                        <label class="rpg-label">Destreza</label>
                        <asp:TextBox runat="server" ID="txtDestreza" CssClass="rpg-input" placeholder="—" />
                    </div>
                    <div class="form-group attr-group">
                        <label class="rpg-label">Sabedoria</label>
                        <asp:TextBox runat="server" ID="txtSabedoria" CssClass="rpg-input" placeholder="—" />
                    </div>
                    <div class="form-group attr-group">
                        <label class="rpg-label">Constituição</label>
                        <asp:TextBox runat="server" ID="txtConstituicao" CssClass="rpg-input" placeholder="—" />
                    </div>
                    <div class="form-group attr-group">
                        <label class="rpg-label">Inteligência</label>
                        <asp:TextBox runat="server" ID="txtInteligencia" CssClass="rpg-input" placeholder="—" />
                    </div>
                    <div class="form-group attr-group">
                        <label class="rpg-label">Carisma</label>
                        <asp:TextBox runat="server" ID="txtCarisma" CssClass="rpg-input" placeholder="—" />
                    </div>
                </div>
            </div>

            <%-- ── Aparência ── --%>
            <div class="rpg-section">
                <div class="rpg-section-title">🪞 Aparência</div>
                <div class="row">
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label class="rpg-label">Peso (kg)</label>
                            <asp:TextBox runat="server" ID="txtPeso" CssClass="rpg-input" placeholder="Ex: 70" />
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label class="rpg-label">Altura (m)</label>
                            <asp:TextBox runat="server" ID="txtAltura" CssClass="rpg-input" placeholder="Ex: 1.75" />
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label class="rpg-label">Cor do Cabelo</label>
                            <asp:TextBox runat="server" ID="txtCorCabelo" CssClass="rpg-input" placeholder="Ex: Preto" />
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">
                            <label class="rpg-label">Estilo do Cabelo</label>
                            <asp:TextBox runat="server" ID="txtEstiloCabelo" CssClass="rpg-input" placeholder="Ex: Liso" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label class="rpg-label">Cor dos Olhos</label>
                            <asp:TextBox runat="server" ID="txtCorOlho" CssClass="rpg-input" placeholder="Ex: Azul" />
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label class="rpg-label">Cor da Pele</label>
                            <asp:TextBox runat="server" ID="txtCorPele" CssClass="rpg-input" placeholder="Ex: Clara" />
                        </div>
                    </div>
                </div>
            </div>

            <%-- ── Botão ── --%>
            <asp:Button
                runat="server"
                ID="btnConfirmar"
                Text="⚔ Criar Personagem"
                CssClass="rpg-btn-submit"
                OnClick="btnConfirmar_Click" />

            <asp:Label runat="server" ID="lblMensagem" CssClass="rpg-msg" />

        </div>
    </div>

</asp:Content>