<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmCartas.aspx.cs"
    MasterPageFile="~/Site.Master" Inherits="CRUDGameSolution.Pages.FrmCartas" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
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
            color: #8888aa;
            font-size: 15px;
            letter-spacing: 1px;
            margin-bottom: 24px;
        }

        .rpg-page-divider {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 28px;
        }

            .rpg-page-divider::after {
                content: '';
                flex: 1;
                height: 1px;
                background: linear-gradient(90deg, #c9a84c33, transparent);
            }

            .rpg-page-divider span {
                color: #c9a84c66;
                font-size: 14px;
            }

        .rpg-btn-back {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: transparent;
            color: #aaaacc;
            font-family: 'Cinzel', serif;
            font-size: 11px;
            letter-spacing: 2px;
            text-transform: uppercase;
            border: 1px solid #2a2a3e;
            border-radius: 4px;
            padding: 7px 16px;
            text-decoration: none !important;
            transition: all .2s;
            margin-bottom: 28px;
        }

            .rpg-btn-back:hover {
                color: #c9a84c;
                border-color: #c9a84c44;
                background: rgba(201,168,76,0.04);
            }

        /* ── Grade de cartas ──────────────────────────────── */
        .cards-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
            gap: 28px;
        }

        /* ── Carta ────────────────────────────────────────── */
        .rpg-carta {
            position: relative;
            background-color: #13131f;
            border: 1px solid #c9a84c55;
            border-radius: 10px;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            transition: transform .3s, box-shadow .3s;
            box-shadow: 0 4px 24px rgba(0,0,0,0.5);
        }

            .rpg-carta:hover {
                transform: translateY(-6px) scale(1.01);
                box-shadow: 0 12px 40px rgba(0,0,0,0.6), 0 0 24px rgba(201,168,76,0.12);
            }

            .rpg-carta::before,
            .rpg-carta::after {
                content: '';
                position: absolute;
                width: 20px;
                height: 20px;
                border-color: #c9a84c88;
                border-style: solid;
                z-index: 2;
                pointer-events: none;
            }

            .rpg-carta::before {
                top: 6px;
                left: 6px;
                border-width: 1px 0 0 1px;
            }

            .rpg-carta::after {
                bottom: 6px;
                right: 6px;
                border-width: 0 1px 1px 0;
            }

        /* ── Cabeçalho da carta ───────────────────────────── */
        .carta-header {
            background: linear-gradient(135deg, #1a1a2e 0%, #0f0f1e 100%);
            border-bottom: 1px solid #c9a84c44;
            padding: 18px 18px 14px;
            text-align: center;
            position: relative;
        }

            .carta-header::after {
                content: '';
                position: absolute;
                bottom: 0;
                left: 20%;
                right: 20%;
                height: 1px;
                background: linear-gradient(90deg, transparent, #c9a84c66, transparent);
            }

        .carta-class-badge {
            display: inline-block;
            font-family: 'Cinzel', serif;
            font-size: 9px;
            letter-spacing: 2.5px;
            text-transform: uppercase;
            color: #c9a84cbb;
            border: 1px solid #c9a84c55;
            border-radius: 20px;
            padding: 2px 10px;
            margin-bottom: 10px;
        }

        .carta-nome {
            font-family: 'Cinzel', serif;
            font-size: 17px;
            font-weight: 700;
            color: #f0e0b0;
            letter-spacing: 2px;
            text-shadow: 0 0 12px rgba(201,168,76,0.25);
            margin-bottom: 4px;
        }

        .carta-raca-sub {
            font-family: 'Crimson Text', serif;
            font-style: italic;
            font-size: 13px;
            color: #a0a0b8;
            letter-spacing: .5px;
        }

        .carta-nivel {
            position: absolute;
            top: 12px;
            right: 14px;
            font-family: 'Cinzel', serif;
            font-size: 10px;
            color: #e8c96a;
            letter-spacing: 1px;
        }

            .carta-nivel span {
                display: block;
                font-size: 18px;
                font-weight: 900;
                line-height: 1;
                text-shadow: 0 0 10px rgba(201,168,76,0.4);
            }

        .carta-icon {
            position: absolute;
            top: 12px;
            left: 14px;
            font-size: 20px;
            opacity: .7;
        }

        /* ── Divisor ornamental ───────────────────────────── */
        .carta-ornament {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            padding: 8px 18px;
            color: #c9a84c55;
            font-size: 10px;
        }

            .carta-ornament::before,
            .carta-ornament::after {
                content: '';
                flex: 1;
                height: 1px;
                background: linear-gradient(90deg, transparent, #c9a84c22);
            }

            .carta-ornament::after {
                background: linear-gradient(270deg, transparent, #c9a84c22);
            }

        /* ── Atributos ────────────────────────────────────── */
        .carta-atributos {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 1px;
            background-color: #0a0a14;
            border-top: 1px solid #1a1a28;
            border-bottom: 1px solid #1a1a28;
        }

        .attr-box {
            background-color: #13131f;
            padding: 10px 6px;
            text-align: center;
            transition: background-color .2s;
        }

        .rpg-carta:hover .attr-box {
            background-color: #14142a;
        }

        .attr-valor {
            font-family: 'Cinzel', serif;
            font-size: 20px;
            font-weight: 700;
            color: #e8c96a;
            line-height: 1;
            text-shadow: 0 0 8px rgba(201,168,76,0.25);
        }

        .attr-nome {
            font-family: 'Cinzel', serif;
            font-size: 8px;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            color: #7a7a9a;
            margin-top: 4px;
        }

        /* ── Aparência ────────────────────────────────────── */
        .carta-aparencia {
            padding: 14px 18px 18px;
            display: flex;
            flex-direction: column;
            gap: 5px;
            flex: 1;
        }

        .aparencia-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #1e1e2e;
            padding-bottom: 5px;
        }

            .aparencia-row:last-child {
                border-bottom: none;
                padding-bottom: 0;
            }

        .ap-key {
            font-family: 'Cinzel', serif;
            font-size: 9px;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            color: #7a7a9a;
        }

        .ap-val {
            font-family: 'Crimson Text', serif;
            font-size: 15px;
            color: #c8c8d8;
            text-align: right;
        }

        /* ── Rodapé da carta ──────────────────────────────── */
        /* ── Botão batalhar ───────────────────────────────── */
        .carta-footer {
            background-color: #0d0d1a;
            border-top: 1px solid #c9a84c22;
            padding: 10px 18px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .carta-footer-text {
            font-family: 'Cinzel', serif;
            font-size: 8px;
            letter-spacing: 3px;
            text-transform: uppercase;
            color: #c9a84c33;
        }

        .btn-batalhar {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            font-family: 'Cinzel', serif;
            font-size: 10px;
            font-weight: 700;
            letter-spacing: 2px;
            text-transform: uppercase;
            color: #0d0d1a;
            background-color: #c9a84c;
            border: none;
            border-radius: 4px;
            padding: 6px 14px;
            text-decoration: none !important;
            transition: all .2s;
            cursor: pointer;
        }

            .btn-batalhar:hover {
                background-color: #e8c96a;
                box-shadow: 0 0 14px rgba(201,168,76,0.4);
                transform: translateY(-1px);
                color: #0d0d1a;
            }

        /* ── Empty state ──────────────────────────────────── */
        .rpg-empty {
            grid-column: 1 / -1;
            text-align: center;
            padding: 80px 20px;
            color: #5a5a7a;
        }

            .rpg-empty .icon {
                font-size: 48px;
                display: block;
                margin-bottom: 16px;
                opacity: .5;
            }

            .rpg-empty p {
                font-family: 'Crimson Text', serif;
                font-style: italic;
                font-size: 18px;
            }

            .rpg-empty a {
                display: inline-block;
                margin-top: 20px;
                font-family: 'Cinzel', serif;
                font-size: 11px;
                letter-spacing: 2px;
                color: #c9a84c99;
                border: 1px solid #c9a84c44;
                border-radius: 4px;
                padding: 8px 20px;
                text-decoration: none;
                transition: all .2s;
            }

                .rpg-empty a:hover {
                    color: #c9a84c;
                    border-color: #c9a84c88;
                    background: rgba(201,168,76,0.05);
                }
    </style>

    <div style="max-width: 1100px; margin: 0 auto;">

        <%-- Cabeçalho --%>
        <div class="rpg-page-title">🃏 Cartas dos Aventureiros</div>
        <p class="rpg-page-subtitle">Cada herói, uma lenda — cada carta, um destino</p>
        <div class="rpg-page-divider"><span>✦</span></div>

        <a href="../Default.aspx" class="rpg-btn-back">← Início</a>

        <a href="FrmPersonagem.aspx" class="rpg-btn-back">+ Criar Personagem</a>

        <%-- Grade de cartas --%>
        <div class="cards-grid">
            <asp:ListView runat="server" ID="lvCartas">
                <ItemTemplate>

                    <div class="rpg-carta">

                        <%-- Header --%>
                        <div class="carta-header">
                            <div class="carta-icon">⚔</div>
                            <div class="carta-nivel">
                                LVL<span><%# Eval("Nivel") %></span>
                            </div>
                            <div class="carta-class-badge"><%# Eval("Subclasses.Descricao") %></div>
                            <div class="carta-nome"><%# Eval("Nome") %></div>
                            <div class="carta-raca-sub">
                                <%# Eval("Racas.Descricao") %> · <%# Eval("Subclasses.Classes.Descricao") %>
                            </div>
                        </div>

                        <%-- Ornamento --%>
                        <div class="carta-ornament">✦</div>

                        <%-- Atributos --%>
                        <div class="carta-atributos">
                            <div class="attr-box">
                                <div class="attr-valor"><%# Eval("Atributos.Forca") %></div>
                                <div class="attr-nome">For</div>
                            </div>
                            <div class="attr-box">
                                <div class="attr-valor"><%# Eval("Atributos.Destreza") %></div>
                                <div class="attr-nome">Des</div>
                            </div>
                            <div class="attr-box">
                                <div class="attr-valor"><%# Eval("Atributos.Sabedoria") %></div>
                                <div class="attr-nome">Sab</div>
                            </div>
                            <div class="attr-box">
                                <div class="attr-valor"><%# Eval("Atributos.Constituicao") %></div>
                                <div class="attr-nome">Con</div>
                            </div>
                            <div class="attr-box">
                                <div class="attr-valor"><%# Eval("Atributos.Inteligencia") %></div>
                                <div class="attr-nome">Int</div>
                            </div>
                            <div class="attr-box">
                                <div class="attr-valor"><%# Eval("Atributos.Carisma") %></div>
                                <div class="attr-nome">Car</div>
                            </div>
                        </div>

                        <%-- Aparência --%>
                        <div class="carta-aparencia">
                            <div class="aparencia-row">
                                <span class="ap-key">Sexo</span>
                                <span class="ap-val"><%# Eval("Sexo") %></span>
                            </div>
                            <div class="aparencia-row">
                                <span class="ap-key">Altura · Peso</span>
                                <span class="ap-val"><%# Eval("Aparencias.Altura") %>m · <%# Eval("Aparencias.Peso") %>kg</span>
                            </div>
                            <div class="aparencia-row">
                                <span class="ap-key">Olhos</span>
                                <span class="ap-val"><%# Eval("Aparencias.CorOlho") %></span>
                            </div>
                            <div class="aparencia-row">
                                <span class="ap-key">Cabelo</span>
                                <span class="ap-val"><%# Eval("Aparencias.EstiloCabelo") %> <%# Eval("Aparencias.CorCabelo") %></span>
                            </div>
                            <div class="aparencia-row">
                                <span class="ap-key">Pele</span>
                                <span class="ap-val"><%# Eval("Aparencias.CorPele") %></span>
                            </div>
                        </div>


                        <div class="carta-footer">
                            <span class="carta-footer-text">RPG de Cartas</span>
                            <a class="btn-batalhar" href='<%# "FrmBatalha.aspx?id=" + Eval("idPersonagem") %>'>⚔ Batalhar
                            </a>
                        </div>

                    </div>

                </ItemTemplate>

                <EmptyDataTemplate>
                    <div class="rpg-empty">
                        <span class="icon">🃏</span>
                        <p>Nenhum aventureiro foi forjado ainda.</p>
                        <a href="FrmPersonagem.aspx">⚔ Criar primeiro personagem</a>
                    </div>
                </EmptyDataTemplate>

            </asp:ListView>
        </div>

    </div>

</asp:Content>
