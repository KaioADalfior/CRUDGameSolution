using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRUDGameSolution.DAOs
{
    public class SubclasseDAO
    {
        public static string CadastrarSubclasse(Subclasse novaSubclasse)
        {
            string mensagem = "";

            try
            {
                using (var ctx = new RPGDBEntities())
                {
                    ctx.Subclasses.Add(novaSubclasse);
                    ctx.SaveChanges();
                }

                mensagem = "Subclasse " + novaSubclasse.Descricao + " cadastrada com sucesso!";

            }
            catch(Exception ex)
            {
                mensagem = ex.Message;
            }

            return mensagem;
        }
    }
}