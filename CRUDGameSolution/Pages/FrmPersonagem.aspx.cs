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

        protected void Cadastrar()
        {

        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {

        }
    }
}