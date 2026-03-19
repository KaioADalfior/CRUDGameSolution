<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CRUDGameSolution._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron text-center" style="background-color: #1a1a2e; color: #e0e0e0; border-radius: 8px; margin-top: 20px;">
        <h1 style="font-size: 48px; letter-spacing: 2px;">
            <span class="glyphicon glyphicon-book"></span>RPG de Cartas
        </h1>
        <p style="font-size: 18px; color: #aaaaaa; margin-top: 10px;">
            Onde a imaginação é o único limite.
       
        </p>
        <hr style="border-color: #444;" />
        <p style="font-size: 15px; max-width: 680px; margin: 0 auto; line-height: 1.8;">
            Este é um RPG sem interface gráfica. Aqui, as aventuras ganham vida através de 
           
            <strong style="color: #c9a84c;">cartas lidas em voz alta</strong>, descrições ricas e 
            da imaginação dos jogadores. Cada personagem é único — moldado por raça, classe, 
            atributos e aparência, mas ganhe forma somente nas mentes de quem joga.
       
        </p>
        <br />
        <a href="Pages/FrmPersonagem.aspx" class="btn btn-lg"
            style="background-color: #c9a84c; color: #1a1a2e; font-weight: bold; border: none;">
            <span class="glyphicon glyphicon-knight"></span>Criar Personagem
        </a>
    </div>

    <div class="row text-center" style="margin-top: 30px; display: flex; flex-wrap: wrap;">

        <div class="col-md-4" style="display: flex;">
            <div class="panel panel-default" style="background-color: #1e1e2e; border-color: #333; color: #ccc; width: 100%;">
                <div class="panel-body" style="padding: 30px;">
                    <span class="glyphicon glyphicon-user" style="font-size: 36px; color: #c9a84c;"></span>
                    <h4 style="color: #e0e0e0; margin-top: 15px;">Monte seu Herói</h4>
                    <p style="color: #999;">
                        Escolha raça, classe, subclasse, atributos e aparência para dar vida ao seu personagem.
                    </p>
                </div>
            </div>
        </div>

        <div class="col-md-4" style="display: flex;">
            <div class="panel panel-default" style="background-color: #1e1e2e; border-color: #333; color: #ccc; width: 100%;">
                <div class="panel-body" style="padding: 30px;">
                    <span class="glyphicon glyphicon-book" style="font-size: 36px; color: #c9a84c;"></span>
                    <h4 style="color: #e0e0e0; margin-top: 15px;">Aventuras em Cartas</h4>
                    <p style="color: #999;">
                        Cada encontro, escolha e batalha é narrado por cartas. Sem telas — apenas palavras e imaginação.
                    </p>
                </div>
            </div>
        </div>

        <div class="col-md-4" style="display: flex;">
            <div class="panel panel-default" style="background-color: #1e1e2e; border-color: #333; color: #ccc; width: 100%;">
                <div class="panel-body" style="padding: 30px;">
                    <span class="glyphicon glyphicon-flash" style="font-size: 36px; color: #c9a84c;"></span>
                    <h4 style="color: #e0e0e0; margin-top: 15px;">Habilidades Únicas</h4>
                    <p style="color: #999;">
                        Cada subclasse carrega habilidades exclusivas que definem seu estilo de jogo e narrativa.
                    </p>
                </div>
            </div>
        </div>

    </div>

</asp:Content>
