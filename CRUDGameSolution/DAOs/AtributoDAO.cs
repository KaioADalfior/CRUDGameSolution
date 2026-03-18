using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRUDGameSolution.DAOs
{
    public class AtributoDAO
    {
        public static string CadastrarAtributo(Atributo novoAtributo)
        {
            string mensagem = "";

            try
            {
                using (var ctx = new RPGDBEntities())
                {
                    ctx.Atributos.Add(novoAtributo);
                    ctx.SaveChanges();
                }
            }
            catch(Exception ex)
            {
                mensagem = "Erro ao cadastrar atributos na DAO: " + ex.Message;
            }
            return mensagem;
        }
    }
}