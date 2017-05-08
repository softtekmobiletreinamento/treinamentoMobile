# language: pt

Funcionalidade: Home não Logada (Tela de Login)
  A home não logada é a primeira tela do aplicativo.

  Erros:
  1) Agência inválida
  2) Conta inválida
  3) Senha inválida, digitada uma, duas ou três vezes
  4) Senha bloqueada
  5) Senha eletrônica não cadastrada


  #Contexto:
    #Dado que estou na Home não Logada

  @reset @DEVOPSMOB-249 @DEVOPSMOB-244 @Universal
  Esquema do Cenário: Posso logar no aplicativo utilizando vários tipos de conta de pessoa física
    Dado que vejo a tela inicial
    E aperto no link ja tenho uma conta
    E pulo o tutorial
    E olho a Home de login
    E inputo o campo "agência" para o dado do "Agência" "<CHAVE>"
    E inputo o campo "conta" para o dado do "Conta" "<CHAVE>"
    E aperto no botao OK
    Então observo a tela de senha eletronica

    Exemplos:
      | CHAVE           |
      | varejo          |