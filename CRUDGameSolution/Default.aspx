<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CRUDGameSolution._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        /* ── Hero ─────────────────────────────────────────── */
        .hero-wrap {
            position: relative;
            background-color: #13131f;
            border: 1px solid #c9a84c33;
            border-radius: 8px;
            padding: 64px 40px 56px;
            text-align: center;
            margin-top: 12px;
            overflow: hidden;
        }
        /* cantos decorativos */
        .hero-wrap::before,
        .hero-wrap::after {
            content: '';
            position: absolute;
            width: 60px;
            height: 60px;
            border-color: #c9a84c55;
            border-style: solid;
        }
        .hero-wrap::before {
            top: 12px; left: 12px;
            border-width: 1px 0 0 1px;
        }
        .hero-wrap::after {
            bottom: 12px; right: 12px;
            border-width: 0 1px 1px 0;
        }

        /* estrelas de fundo */
        .hero-wrap .stars {
            position: absolute;
            inset: 0;
            background-image:
                radial-gradient(1px 1px at 20%  30%, #c9a84c22 0%, transparent 100%),
                radial-gradient(1px 1px at 75%  15%, #c9a84c18 0%, transparent 100%),
                radial-gradient(1px 1px at 50%  70%, #c9a84c15 0%, transparent 100%),
                radial-gradient(1px 1px at 10%  80%, #c9a84c10 0%, transparent 100%),
                radial-gradient(1px 1px at 88%  60%, #c9a84c12 0%, transparent 100%);
            pointer-events: none;
        }

        .hero-eyebrow {
            font-family: 'Cinzel', serif;
            font-size: 11px;
            letter-spacing: 5px;
            text-transform: uppercase;
            color: #c9a84c88;
            margin-bottom: 18px;
        }

        .hero-title {
            font-family: 'Cinzel', serif;
            font-size: 48px;
            font-weight: 900;
            color: #c9a84c;
            letter-spacing: 6px;
            text-shadow: 0 0 40px rgba(201,168,76,0.35), 0 2px 4px rgba(0,0,0,0.8);
            margin-bottom: 10px;
            line-height: 1.1;
        }

        .hero-sub {
            font-family: 'Crimson Text', serif;
            font-style: italic;
            font-size: 18px;
            color: #666;
            letter-spacing: 1px;
            margin-bottom: 28px;
        }

        .hero-divider {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 14px;
            margin: 28px auto;
            max-width: 420px;
        }
        .hero-divider::before,
        .hero-divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background: linear-gradient(90deg, transparent, #c9a84c44);
        }
        .hero-divider::after {
            background: linear-gradient(270deg, transparent, #c9a84c44);
        }
        .hero-divider span {
            color: #c9a84c66;
            font-size: 14px;
        }

        .hero-lore {
            font-family: 'Crimson Text', serif;
            font-size: 17px;
            color: #888;
            max-width: 600px;
            margin: 0 auto 36px;
            line-height: 1.9;
        }
        .hero-lore strong {
            color: #c9a84c;
            font-weight: 600;
        }

        .hero-cta {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            background-color: #c9a84c;
            color: #0d0d1a;
            font-family: 'Cinzel', serif;
            font-size: 13px;
            font-weight: 700;
            letter-spacing: 3px;
            text-transform: uppercase;
            text-decoration: none !important;
            padding: 14px 36px;
            border-radius: 4px;
            transition: all .25s;
            position: relative;
        }
        .hero-cta:hover {
            background-color: #e8c96a;
            box-shadow: 0 0 28px rgba(201,168,76,0.5);
            transform: translateY(-2px);
            color: #0d0d1a;
        }
        .hero-cta:active { transform: translateY(0); }

        /* ── Cards ────────────────────────────────────────── */
        .feature-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-top: 32px;
        }
        @media (max-width: 767px) {
            .feature-grid { grid-template-columns: 1fr; }
            .hero-title { font-size: 30px; letter-spacing: 3px; }
        }

        .feature-card {
            position: relative;
            background-color: #1e1e2e;
            border: 1px solid #2a2a3e;
            border-radius: 6px;
            padding: 36px 28px 32px;
            text-align: center;
            transition: all .3s;
            overflow: hidden;
        }
        .feature-card::before {
            content: '';
            position: absolute;
            inset: 0;
            background: radial-gradient(ellipse at 50% 0%, rgba(201,168,76,0.06) 0%, transparent 70%);
            opacity: 0;
            transition: opacity .3s;
        }
        .feature-card:hover {
            border-color: #c9a84c44;
            transform: translateY(-4px);
            box-shadow: 0 12px 40px rgba(0,0,0,0.4), 0 0 20px rgba(201,168,76,0.08);
        }
        .feature-card:hover::before { opacity: 1; }

        .feature-icon {
            font-size: 36px;
            display: block;
            margin-bottom: 18px;
            filter: drop-shadow(0 0 8px rgba(201,168,76,0.3));
        }

        .feature-title {
            font-family: 'Cinzel', serif;
            font-size: 14px;
            font-weight: 700;
            letter-spacing: 2px;
            color: #e0e0e0;
            text-transform: uppercase;
            margin-bottom: 12px;
        }

        .feature-desc {
            font-family: 'Crimson Text', serif;
            font-size: 16px;
            color: #666;
            line-height: 1.8;
        }

        /* linha dourada decorativa no topo dos cards */
        .feature-card::after {
            content: '';
            position: absolute;
            top: 0; left: 30%; right: 30%;
            height: 1px;
            background: linear-gradient(90deg, transparent, #c9a84c55, transparent);
            transition: left .3s, right .3s;
        }
        .feature-card:hover::after { left: 10%; right: 10%; }
    </style>

    <%-- ══ HERO ══════════════════════════════════════════ --%>
    <div class="hero-wrap">
        <div class="stars"></div>

        <div class="hero-eyebrow">✦ &nbsp; Bem-vindo à Mesa &nbsp; ✦</div>

        <h1 class="hero-title">RPG Battle</h1>
        <p class="hero-sub">Onde a imaginação é o único limite.</p>

        <div class="hero-divider"><span>⚔</span></div>

        <p class="hero-lore">
            Este é um RPG sem interface gráfica. As aventuras ganham vida através de
            <strong>cartas lidas em voz alta</strong>, descrições ricas e
            da imaginação dos jogadores. Cada personagem é único — moldado por raça,
            classe, atributos e aparência, mas ganha forma somente nas mentes de quem joga.
        </p>

        <a href="Pages/FrmPersonagem.aspx" class="hero-cta">
            ⚔ &nbsp; Criar Personagem
        </a>
    </div>

    <%-- ══ CARDS ═════════════════════════════════════════ --%>
    <div class="feature-grid">

        <div class="feature-card">
            <span class="feature-icon">🧝</span>
            <div class="feature-title">Monte seu Herói</div>
            <p class="feature-desc">
                Escolha raça, classe, subclasse, atributos e aparência para dar vida ao seu personagem.
            </p>
        </div>

        <div class="feature-card">
            <span class="feature-icon">🃏</span>
            <div class="feature-title">Aventuras em Cartas</div>
            <p class="feature-desc">
                Cada encontro, escolha e batalha é narrado por cartas. Sem telas — apenas palavras e imaginação.
            </p>
        </div>

        <div class="feature-card">
            <span class="feature-icon">⚡</span>
            <div class="feature-title">Habilidades Únicas</div>
            <p class="feature-desc">
                Cada subclasse carrega habilidades exclusivas que definem seu estilo de jogo e narrativa.
            </p>
        </div>

    </div>

</asp:Content>