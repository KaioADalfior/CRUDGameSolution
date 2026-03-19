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
            List<Subclasse> subclasses = DAOs.SubclasseDAO.ListarSubclasses();

            PreencherDDLRaca(racas);
            PreencherDDLSubclasse(subclasses);
        }

        private void PreencherDDLRaca(List<Raca> racas)
        {
            ddlRaca.DataSource = racas;
            ddlRaca.DataTextField = "Descricao";
            ddlRaca.DataValueField = "idRaca";
            ddlRaca.DataBind();
            ddlRaca.Items.Insert(0, "Selecione...");
        }

        private void PreencherDDLSubclasse(List<Subclasse> subclasses)
        {
            ddlSubclasse.DataSource = subclasses;
            ddlSubclasse.DataTextField = "Descricao";
            ddlSubclasse.DataValueField = "idSubclasse";
            ddlSubclasse.DataBind();
            ddlSubclasse.Items.Insert(0, "Selecione...");
        }

        private void LimparCampos()
        {

        }

        protected void Cadastrar()
        {
         
            //atributos

            string forca = txtForca.Text;
            string destreza = txtDestreza.Text;
            string sabedoria = txtSabedoria.Text;
            string constituicao = txtConstituicao.Text;
            string inteligencia = txtInteligencia.Text;
            string carisma = txtCarisma.Text;

            if(forca != "" && destreza != "" && sabedoria != "" && 
                constituicao != "" && inteligencia != "" && carisma != "")
            {
                Atributo novoAtributo = new Atributo();

                novoAtributo.Forca = Convert.ToInt32(forca);
                novoAtributo.Destreza = Convert.ToInt32(destreza);
                novoAtributo.Sabedoria = Convert.ToInt32(sabedoria);
                novoAtributo.Constituicao = Convert.ToInt32(constituicao);
                novoAtributo.Inteligencia = Convert.ToInt32(inteligencia);
                novoAtributo.Carisma = Convert.ToInt32(carisma);

                string mensagem =
                    DAOs.AtributoDAO.CadastrarAtributo(novoAtributo);

                
                //aparencia
                string peso = txtPeso.Text;
                string altura = txtAltura.Text;
                string corCabelo = txtCorCabelo.Text;
                string estiloCabelo = txtEstiloCabelo.Text;
                string corOlhos = txtCorOlho.Text;
                string corPele = txtCorPele.Text;

                if(peso != "" && altura != "" && corCabelo != "" &&
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

                    //cadastrar personagem aqui


                    
                    //personagem
                    string nome = txtNome.Text;
                    string nivel = txtNivel.Text;
                    string sexo = txtSexo.Text;

                    //ddls de raca e subclasse
                    int indexRaca = ddlRaca.SelectedIndex;
                    int indexSubclasse = ddlSubclasse.SelectedIndex;


                    //refatorar os index para pegar as DDLs.       
                }

            }


              
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            Cadastrar();
        }
    }
}