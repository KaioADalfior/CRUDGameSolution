using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUDGameSolution.Pages
{
    public partial class FrmRaca : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PopularLVs();
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            Cadastrar();
            PopularLVs();
        }

        protected void Cadastrar()
        {
            try
            {
                string descricao = txtDescricao.Text;

                if (descricao != "")
                {
                    Raca novaRaca = new Raca();
                    novaRaca.Descricao = descricao;

                    string mensagem = DAOs.RacaDAO.CadastrarRacas(novaRaca);

                    txtDescricao.Text = "";
                    
                    lblMensagem.InnerText = mensagem;
                }
            }
            catch(Exception ex)
            {
                lblMensagem.InnerText = "Raça não cadastrada. Erro na função FrmRaca.Cadastrar(): " + ex.Message;
            }
        }

        private void PopularLVRacas(List<Raca> racas)
        {
            lvRacas.DataSource = racas;
            lvRacas.DataBind();
        }

        private void PopularLVs()
        {
            var racas = DAOs.RacaDAO.ListarRacas();
            PopularLVRacas(racas);
        }
    }
}