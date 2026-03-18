using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUDGameSolution.Pages
{
    public partial class FrmClasses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PopularLVs();
        }

        private void Cadastrar()
        {
            string descricao = txtDescricao.Text;

            if(descricao != null)
            {
                Classe novaClasse = new Classe();
                novaClasse.Descricao = descricao;

                string mensagem = DAOs.ClasseDAO.CadastrarClasses(novaClasse);

                txtDescricao.Text = "";
                
                lblMensagem.InnerText = mensagem;

            }
        }

        private void PopularLVClasses(List<Classe> classes)
        {
            lvClasses.DataSource = classes;
            lvClasses.DataBind();
        }

        private void PopularLVs()
        {
            var classes = DAOs.ClasseDAO.ListarClasses();
            PopularLVClasses(classes);
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            Cadastrar();
            PopularLVs();
        }
    }
}