using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUDGameSolution.Pages
{
    public partial class FrmPersonagem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PreencherDDLs();
            }
        }

        private void PreencherDDLs()
        {
            List<Raca> racas = DAOs.RacaDAO.ListarRacas();
            List<Classe> classes = DAOs.ClasseDAO.ListarClasses();

            PreencherDDLRaca(racas);
            PreencherDDLClasse(classes);

            // Subclasse começa vazia até o usuário escolher uma classe
            ddlSubclasse.Items.Clear();
            ddlSubclasse.Items.Insert(0, "Selecione uma classe primeiro...");
        }

        private void PreencherDDLRaca(List<Raca> racas)
        {
            ddlRaca.DataSource = racas;
            ddlRaca.DataTextField = "Descricao";
            ddlRaca.DataValueField = "idRaca";
            ddlRaca.DataBind();
            ddlRaca.Items.Insert(0, "Selecione...");
        }

        private void PreencherDDLClasse(List<Classe> classes)
        {
            ddlClasse.DataSource = classes;
            ddlClasse.DataTextField = "Descricao";
            ddlClasse.DataValueField = "idClasse";
            ddlClasse.DataBind();
            ddlClasse.Items.Insert(0, "Selecione...");
        }

        private void PreencherDDLSubclasse(int idClasse)
        {
            ddlSubclasse.Items.Clear();

            if (idClasse == 0)
            {
                ddlSubclasse.Items.Insert(0, "Selecione uma classe primeiro...");
                return;
            }

            List<Subclasse> subclasses = DAOs.SubclasseDAO.ListarSubclassesPorClasse(idClasse);

            if (subclasses.Count == 0)
            {
                ddlSubclasse.Items.Insert(0, "Nenhuma subclasse encontrada...");
                return;
            }

            ddlSubclasse.DataSource = subclasses;
            ddlSubclasse.DataTextField = "Descricao";
            ddlSubclasse.DataValueField = "idSubclasse";
            ddlSubclasse.DataBind();
            ddlSubclasse.Items.Insert(0, "Selecione...");
        }

        // Disparado pelo AutoPostBack do ddlClasse
        protected void ddlClasse_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idClasse = Convert.ToInt32(ddlClasse.SelectedValue);
            PreencherDDLSubclasse(idClasse);
        }

        protected void Cadastrar()
        {
            // Atributos
            string forca = txtForca.Text;
            string destreza = txtDestreza.Text;
            string sabedoria = txtSabedoria.Text;
            string constituicao = txtConstituicao.Text;
            string inteligencia = txtInteligencia.Text;
            string carisma = txtCarisma.Text;

            if (forca != "" && destreza != "" && sabedoria != "" &&
                constituicao != "" && inteligencia != "" && carisma != "")
            {
                Atributo novoAtributo = new Atributo();

                novoAtributo.Forca = Convert.ToInt32(forca);
                novoAtributo.Destreza = Convert.ToInt32(destreza);
                novoAtributo.Sabedoria = Convert.ToInt32(sabedoria);
                novoAtributo.Constituicao = Convert.ToInt32(constituicao);
                novoAtributo.Inteligencia = Convert.ToInt32(inteligencia);
                novoAtributo.Carisma = Convert.ToInt32(carisma);

                string mensagem = DAOs.AtributoDAO.CadastrarAtributo(novoAtributo);

                // Aparência
                string peso = txtPeso.Text;
                string altura = txtAltura.Text;
                string corCabelo = txtCorCabelo.Text;
                string estiloCabelo = txtEstiloCabelo.Text;
                string corOlhos = txtCorOlho.Text;
                string corPele = txtCorPele.Text;

                if (peso != "" && altura != "" && corCabelo != "" &&
                    estiloCabelo != "" && corOlhos != "" && corPele != "")
                {
                    Aparencia novaAparencia = new Aparencia();

                    novaAparencia.Peso = Convert.ToDecimal(peso);
                    novaAparencia.Altura = Convert.ToDecimal(altura);
                    novaAparencia.CorCabelo = corCabelo;
                    novaAparencia.EstiloCabelo = estiloCabelo;
                    novaAparencia.CorOlho = corOlhos;
                    novaAparencia.CorPele = corPele;

                    mensagem = DAOs.AparenciaDAO.CadastrarAparencia(novaAparencia);

                    // Personagem
                    string nome = txtNome.Text;
                    string nivel = txtNivel.Text;
                    string sexo = txtSexo.Text;

                    int indexRaca = ddlRaca.SelectedIndex;
                    int indexClasse = ddlClasse.SelectedIndex;
                    int indexSubclasse = ddlSubclasse.SelectedIndex;

                    if (indexRaca == 0 || indexClasse == 0 || indexSubclasse == 0)
                    {
                        lblMensagem.Text = "Você precisa selecionar Raça, Classe e Subclasse!";
                        return;
                    }

                    if (nome != "" && nivel != "" && sexo != "")
                    {
                        Personagem novoPersonagem = new Personagem();

                        novoPersonagem.Nome = nome;
                        novoPersonagem.Nivel = Convert.ToInt32(nivel);
                        novoPersonagem.Sexo = sexo;

                        novoPersonagem.idRaca = Convert.ToInt32(ddlRaca.SelectedValue);
                        novoPersonagem.idSubclasse = Convert.ToInt32(ddlSubclasse.SelectedValue);
                        // ddlClasse NÃO é salvo — a classe já está implícita via FK na subclasse

                        novoPersonagem.idAtributo = novoAtributo.idAtributo;
                        novoPersonagem.idAparencia = novaAparencia.idAparencia;

                        mensagem = DAOs.PersonagemDAO.CadastrarPersonagem(novoPersonagem);

                        lblMensagem.Text = "PERSONAGEM CADASTRADO COM SUCESSO!";
                    }
                }
            }
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            Cadastrar();
        }
    }
}