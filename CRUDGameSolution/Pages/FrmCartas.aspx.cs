using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUDGameSolution.Pages
{
    public partial class FrmCartas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CarregarCartas();
        }

        private void CarregarCartas()
        {
            List<Personagem> personagens = DAOs.PersonagemDAO.ListarPersonagens();
            lvCartas.DataSource = personagens;
            lvCartas.DataBind();
        }
    }
}