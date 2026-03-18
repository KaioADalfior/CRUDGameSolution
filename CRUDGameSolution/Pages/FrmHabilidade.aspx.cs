using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUDGameSolution.Pages
{
    public partial class FrmHabilidade : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PopularLVs();
        }

        protected void Cadastrar()
        {
            string descricao = txtDescricao.Text;
            
            if(descricao != "")
            {
                Habilidade novaHabilidade = new Habilidade();
                novaHabilidade.Descricao = descricao;

                string mensagem = DAOs.HabilidadeDAO.CadastrarHabilidades(novaHabilidade);

                lblMensagem.InnerText = mensagem;

                txtDescricao.Text = "";
            }
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            Cadastrar();
            PopularLVs();
        }

        private void PopularLVHabilidades(List<Habilidade> habilidades)
        {
            lvHabilidades.DataSource = habilidades;
            lvHabilidades.DataBind();
        }

        private void PopularLVs()
        {
            var habilidades = DAOs.HabilidadeDAO.ListarHabilidades();
            PopularLVHabilidades(habilidades);
        }
    }
}