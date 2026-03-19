<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmSubclasse.aspx.cs" MasterPageFile="~/Site.Master" Inherits="CRUDGameSolution.Pages.FrmSubclasse" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .rpg-card {
            position: relative;
            background-color: #1e1e2e;
            border: 1px solid #c9a84c33;
            border-radius: 6px;
            padding: 28px;
            margin-bottom: 24px;
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

        .rpg-section-title {
            font-family: 'Cinzel', serif;
            font-size: 12px;
            letter-spacing: 3px;
            text-transform: uppercase;
            color: #c9a84c;
            border-bottom: 1px solid #c9a84c2a;
            padding-bottom: 10px;
            margin-bottom: 22px;
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
            background-color: #0f0f1e !important;
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

        /* Dropdown option styling */
        .rpg-select option {
            background-color: #0f0f1e;
            color: #e0e0e0;
        }

        .rpg-btn-primary {
            width: 100%;
            background-color: #c9a84c;
            color: #0d0d1a;
            font-family: 'Cinzel', serif;
            font-size: 11px;
            font-weight: 700;
            letter-spacing: 2.5px;
            text-transform: uppercase;
            border: none;
            border-radius: 4px;
            padding: 11px 20px;
            cursor: pointer;
            transition: all .2s;
            display: block;
        }
        .rpg-btn-primary:hover {
            background-color: #e8c96a;
            box-shadow: 0 0 20px rgba(201,168,76,0.4);
            transform: translateY(-1px);
        }
        .rpg-msg {
            font-family: 'Crimson Text', serif;
            font-style: italic;
            font-size: 15px;
            color: #c9a84c;
            display: block;
            margin-top: 12px;
            min-height: 20px;
        }
        .rpg-table { width: 100%; border-collapse: collapse; }
        .rpg-table thead tr {
            background-color: #13131f;
            border-bottom: 1px solid #c9a84c33;
        }
        .rpg-table thead th {
            font-family: 'Cinzel', serif;
            font-size: 10px;
            letter-spacing: 2.5px;
            text-transform: uppercase;
            color: #c9a84c99;
            padding: 13px 18px;
            font-weight: 400;
        }
        .rpg-table tbody tr {
            border-bottom: 1px solid #1a1a28;
            transition: background-color .15s;
        }
        .rpg-table tbody tr:hover { background-color: #16162a; }
        .rpg-table tbody td {
            padding: 13px 18px;
            vertical-align: middle;
            font-family: 'Crimson Text', serif;
            font-size: 16px;
            color: #ccc;
        }
        .rpg-table tbody td.col-id {
            font-family: 'Cinzel', serif;
            font-size: 12px;
            color: #c9a84c55;
            letter-spacing: 1px;
        }
        /* Badge de classe */
        .rpg-badge {
            display: inline-block;
            background-color: #1c1600;
            color: #c9a84c99;
            font-family: 'Cinzel', serif;
            font-size: 10px;
            letter-spacing: 1px;
            text-transform: uppercase;
            padding: 3px 10px;
            border-radius: 20px;
            border: 1px solid #3a2e0088;
        }
        .rpg-btn-act {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            font-family: 'Cinzel', serif;
            font-size: 10px;
            letter-spacing: 1px;
            padding: 5px 11px;
            border-radius: 3px;
            border: 1px solid;
            cursor: pointer;
            transition: all .15s;
            margin-right: 4px;
            text-transform: uppercase;
        }
        .rpg-btn-act:hover { transform: translateY(-1px); }
        .rpg-btn-act.view { background:#0d1e2a; color:#5bc0de; border-color:#1a4055; }
        .rpg-btn-act.edit { background:#1c1600; color:#c9a84c; border-color:#3a2e00; }
        .rpg-btn-act.del  { background:#1c0d0d; color:#e05c5c; border-color:#3a1a1a; }
        .rpg-btn-act.view:hover { background:#102838; box-shadow:0 0 10px rgba(91,192,222,0.2); }
        .rpg-btn-act.edit:hover { background:#241c00; box-shadow:0 0 10px rgba(201,168,76,0.2); }
        .rpg-btn-act.del:hover  { background:#241010; box-shadow:0 0 10px rgba(224,92,92,0.2);  }

        .rpg-empty { text-align:center; padding:48px 20px; color:#3a3a52; }
        .rpg-empty .icon { font-size:32px; display:block; margin-bottom:10px; }
        .rpg-empty p { font-family:'Crimson Text',serif; font-style:italic; font-size:16px; }
    </style>

    <div style="max-width: 860px; margin: 0 auto;">

        <%-- Cabeçalho --%>
        <div class="rpg-page-title">📋 Gerenciar Subclasses</div>
        <p class="rpg-page-subtitle">Especialize os caminhos — cada escolha molda um destino</p>
        <div class="rpg-page-divider"><span>✦</span></div>

        <%-- Voltar --%>
        <a href="../Default.aspx" class="rpg-btn-back">← Início</a>

        <%-- Card Formulário --%>
        <div class="rpg-card">
            <div class="rpg-section-title">✦ Nova Subclasse</div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group" style="margin-bottom:0;">
                        <label class="rpg-label">Nome da Subclasse</label>
                        <asp:TextBox
                            runat="server"
                            ID="txtDescricao"
                            CssClass="rpg-input"
                            placeholder="Ex: Necromante, Assassino, Paladino..." />
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group" style="margin-bottom:0;">
                        <label class="rpg-label">Classe</label>
                        <asp:DropDownList
                            runat="server"
                            ID="DDLClasse"
                            CssClass="rpg-select" />
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group" style="margin-bottom:0;">
                        <label class="rpg-label" style="color:transparent;">—</label>
                        <asp:Button
                            Text="Cadastrar"
                            runat="server"
                            ID="btnConfirmar"
                            OnClick="btnConfirmar_Click"
                            CssClass="rpg-btn-primary" />
                    </div>
                </div>
            </div>
            <label id="lblMensagem" runat="server" class="rpg-msg"></label>
        </div>

        <%-- Card Tabela --%>
        <div class="rpg-card">
            <div class="rpg-section-title">📜 Subclasses Cadastradas</div>
            <div style="overflow-x:auto; border-radius:4px; border:1px solid #1a1a28;">
                <table class="rpg-table">
                    <thead>
                        <tr>
                            <th style="width:80px;">#</th>
                            <th>Descrição</th>
                            <th>Classe</th>
                            <th style="width:240px;">Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:ListView runat="server" ID="lvSubclasses">
                            <ItemTemplate>
                                <tr>
                                    <td class="col-id"><%# Eval("idSubclasse") %></td>
                                    <td><%# Eval("Descricao") %></td>
                                    <td>
                                        <span class="rpg-badge"><%# Eval("Classes.Descricao") %></span>
                                    </td>
                                    <td>
                                        <button class="rpg-btn-act view">👁</button>
                                        <button class="rpg-btn-act edit">✎</button>
                                        <button class="rpg-btn-act del">✕</button>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <tr>
                                    <td colspan="4">
                                        <div class="rpg-empty">
                                            <span class="icon">📋</span>
                                            <p>Nenhuma subclasse registrada ainda.</p>
                                        </div>
                                    </td>
                                </tr>
                            </EmptyDataTemplate>
                        </asp:ListView>
                    </tbody>
                </table>
            </div>
        </div>

    </div>

</asp:Content>