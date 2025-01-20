algoritmo "semnome"
//
//
var
   Casa_Open : vetor [1..9] de logico
   Casa : vetor [1..3,1..3] de caractere
   C,Casa_Jogada, Valor,i,Rodada : inteiro
   Resposta,Jogador : caractere
   Ganhou : logico

procedimento Menu()
inicio
   escreval("que tal jogar um jogo da velha?[S/N]")
   leia(Resposta)
   se((Resposta = "S") ou ((Resposta = "s") ou (Resposta = "sim"))) entao
      limpatela
      init()
   senao
      escreval("certo!,Entendi como um 'Nao'")
   FimSe
FimProcedimento

procedimento init()
inicio
   valor <- 0
   Rodada <- 1
   para i de 1 ate 3 faca
      para c de 1 ate 3 faca
         valor <- valor + 1
         Casa[i,c] <- numpCarac(Valor)
      fimpara
   fimpara

   Jogador <- "X"

   start()
FimProcedimento

procedimento tabela()
inicio

   escreval("          JOGO DA VELHA!            ")
   escreval
   escreval("          #            #            ")
   escreval("     ",Casa[1,1],"    #     ",Casa[1,2],"      #     ",Casa[1,3],"    ")
   escreval("          #            #            ")
   escreval("####################################")
   escreval("          #            #            ")
   escreval("     ",Casa[2,1],"    #     ",Casa[2,2],"      #     ",Casa[2,3],"    ")
   escreval("          #            #            ")
   escreval("####################################")
   escreval("          #            #            ")
   escreval("     ",Casa[3,1],"    #     ",Casa[3,2],"      #     ",Casa[3,3],"    ")
   escreval("          #            #            ")

FimProcedimento

procedimento start()
inicio
   movimento()
fimProcedimento

procedimento Verifica_Casa(X:inteiro)
inicio
   se(Casa_Open[x] = Verdadeiro) entao
      limpatela
      escreval("----CASA JÁ ESCOLHIDA, ESCOLHA OUTRA----")
      escreval
      movimento()
   senao
      Casa_Open[x] <- verdadeiro
      limpatela
   fimse
fimProcedimento

procedimento movimento()
inicio

   repita
      tabela()

      se(Jogador = "X") entao
         escreva("VEZ DO JOGADOR X, QUAL CASA QUER JOGAR? ")
         Leia(Casa_Jogada)
         para i de 1 ate 3 faca
            para c de 1 ate 3 faca
               se (Casa[i,c] = numpcarac(Casa_Jogada)) entao
                  Casa[i,c] <- "X"
               fimse
            fimpara
         fimpara
         Verifica_Casa(Casa_Jogada)
         VerificaGanhador("X")
         Jogador <- "O"
      senao
         escreva("VEZ DO JOGADOR O, QUAL CAsA QUER JOGAR?")
         Leia(Casa_Jogada)
         para i de 1 ate 3 faca
            para c de 1 ate 3 faca
               se (Casa[i,c] = numpcarac(Casa_Jogada)) entao
                  Casa[i,c] <- "O"
               fimse
            fimpara
         fimpara
         Verifica_Casa(Casa_Jogada)
         VerificaGanhador("O")
         Jogador <- "X"
      FimSe
   ate(Ganhou = Verdadeiro)
FimProcedimento

procedimento VerificaGanhador(x: caractere)
inicio
   se (Rodada > 9) entao
      Ganhou <- Verdadeiro
      escreval("DEU VELHA!")
   fimse
   {VERIFICACÃO HORIZONTAL}
   para i de 1 ate 3 faca
      se (Casa[i,1] = Casa[i,2]) e (Casa[i,2] = Casa[i,3]) entao
         Ganhou <- Verdadeiro
         escreval("o JOGADOR [",Casa[i,1],"] GANHOU!")
      fimse
   fimpara
   {VERIFICAÇÃO VERTICAL}
   para i de 1 ate 3 faca
      se (Casa[1,i] = Casa[2,i]) e (Casa[2,i] = Casa[3,i]) entao
         Ganhou <- Verdadeiro
         escreval("o JOGADOR [",Casa[3,i],"] GANHOU!")
      fimse
   fimpara
   {VERIFICAÇÃO DIAGONAL}
   se (Casa[1,1] = Casa[2,2]) e (Casa[2,2] = Casa[3,3]) entao
      Ganhou <- Verdadeiro
      escreval("o JOGADOR [",Casa[2,2],"] GANHOU!")
   fimse
   se (Casa[1,3] = Casa[2,2]) e (Casa[2,2] = Casa[3,1]) entao
      Ganhou <- Verdadeiro
      escreval("o JOGADOR [",Casa[2,2],"] GANHOU!")
   fimse

   Rodada <- Rodada + 1


fimprocedimento

inicio
   Menu()
fimalgoritmo