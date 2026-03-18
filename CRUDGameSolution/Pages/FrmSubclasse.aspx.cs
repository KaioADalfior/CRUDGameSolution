using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUDGameSolution.Pages
{
    public partial class FrmSubclasse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Classe> classes = DAOs.ClasseDAO.ListarClasses();
                PreencherDDLClasse(classes);
            }
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            Cadastrar();
        }

        protected void Cadastrar()
        {
            try
            {
                string descricao = txtDescricao.Text;
                int index = DDLClasse.SelectedIndex;

                if (index == 0)
                {
                    lblMensagem.InnerText = "Você precisa selecionar uma classe!";

                }
                else if (descricao != "")
                {
                    Subclasse novaSubclasse = new Subclasse();

                    novaSubclasse.Descricao = descricao;

                    int idClasse = Convert.ToInt32(DDLClasse.SelectedValue);
                    novaSubclasse.idClasse = idClasse;

                    string mensagem = DAOs.SubclasseDAO.CadastrarSubclasse(novaSubclasse);

                    txtDescricao.Text = "";
                    lblMensagem.InnerText = mensagem;
                }
            }
            catch(Exception ex)
            {
                lblMensagem.InnerText = "Erro ao cadastrar subclasses: " + ex.Message;
            }
        }

        private void PreencherDDLClasse(List<Classe> classes)
        {
            DDLClasse.DataSource = classes;
            DDLClasse.DataTextField = "Descricao";
            DDLClasse.DataValueField = "idClasse";
            DDLClasse.DataBind();
            DDLClasse.Items.Insert(0, "Selecione...");
        }
    }
}