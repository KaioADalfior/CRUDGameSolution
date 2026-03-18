using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRUDGameSolution.DAOs
{
    public class ClasseDAO
    {
        public static string CadastrarClasses(Classe novaClasse)
        {
            string mensagem = "";
            try
            {
                using(RPGDBEntities ctx = new RPGDBEntities())
                {
                    ctx.Classes.Add(novaClasse);
                    ctx.SaveChanges();

                    mensagem = "Classe " + novaClasse.Descricao + " cadastrada com sucesso!";
                }
            }
            catch(Exception ex)
            {
                mensagem = ex.Message;
            }
            return mensagem;
        }

        public static List<Classe> ListarClasses()
        {
            List<Classe> classes = null;

            try
            {
                using(var ctx = new RPGDBEntities())
                {
                    classes = ctx.Classes.OrderBy(x => x.Descricao).ToList();
                }
            }
            catch(Exception ex)
            {

            }
            return classes;
        }
    }
}