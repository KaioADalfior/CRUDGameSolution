using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRUDGameSolution.DAOs
{
    public class AparenciaDAO
    {
        public static string CadastrarAparencia(Aparencia novaAparencia)
        {
            string mensagem = "";

            try
            {
                using (var ctx = new RPGDBEntities())
                {
                    ctx.Aparencias.Add(novaAparencia);
                    ctx.SaveChanges();
                }
            }
            catch(Exception ex)
            {
                mensagem = "Erro ao cadastrar aparencia na DAO: " + ex.Message;
            }
            return mensagem;

        }
    }
}