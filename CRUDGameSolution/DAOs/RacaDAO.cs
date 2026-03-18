using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRUDGameSolution.DAOs
{
    public class RacaDAO
    {
        public static string CadastrarRacas(Raca novaRaca)
        {
            string mensagem = "";
            try
            {
                using(RPGDBEntities ctx = new RPGDBEntities())
                {
                    ctx.Racas.Add(novaRaca);

                    ctx.SaveChanges();

                }
                mensagem = "Raça " + novaRaca.Descricao + " cadastrada com sucesso!";
            }
            catch (Exception ex)
            {
                mensagem = ex.Message;
            }
            return mensagem;
        }

        public static List<Raca> ListarRacas()
        {
            List<Raca> racas = null;

            try
            {
                using (var ctx = new RPGDBEntities())
                {
                    racas = ctx.Racas.OrderBy(x => x.Descricao).ToList();
                }
            }
            catch (Exception ex)
            {

            }

            return racas;
        }
    }
}