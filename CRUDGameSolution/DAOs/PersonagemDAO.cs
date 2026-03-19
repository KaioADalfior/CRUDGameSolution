using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRUDGameSolution.DAOs
{
    public class PersonagemDAO
    {
        public static string CadastrarPersonagem(Personagem novoPersonagem)
        {
            string mensagem = "";

            try
            {
                using(var ctx = new RPGDBEntities())
                {
                    Personagem personagem =
                        ctx.Personagens.Add(novoPersonagem);

                    ctx.SaveChanges();

                    mensagem = "Personagem " + novoPersonagem.Nome + " cadastrado com sucesso!";
                }
            }
            catch(Exception ex)
            {
                mensagem = "Ocorreu um erro: " + ex.Message;
            }
            return mensagem;
        }
    }
}