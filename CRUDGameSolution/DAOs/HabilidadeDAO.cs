using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRUDGameSolution.DAOs
{
    public class HabilidadeDAO
    {
        public static string CadastrarHabilidades(Habilidade novaHabilidade)
        {
            string mensagem = "";

            try
            {
                using (var ctx = new RPGDBEntities())
                {
                    ctx.Habilidades.Add(novaHabilidade);
                    ctx.SaveChanges();
                }
                
                mensagem = "Habilidade " + novaHabilidade.Descricao + " cadastrada com sucesso!";
            }


            catch (Exception ex)
            {
                mensagem = ex.Message;
            }
            return mensagem;
        }

        public static List<Habilidade> ListarHabilidades()
        {
            List<Habilidade> habilidades = null;

            try
            {
                using(var ctx = new RPGDBEntities())
                {
                    habilidades = ctx.Habilidades.OrderBy(x => x.Descricao).ToList();
                }
            }
            catch(Exception ex)
            {

            }
            return habilidades;
        }
    }


}