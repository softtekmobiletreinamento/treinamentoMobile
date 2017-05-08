# coding: utf-8

## Home não logada ##
def open_welcome_screen(datapool, key)
  steps %(
      E que vejo a tela de boas vindas
      E clico no link ja tenho uma conta
      E saio da tela de whats new
      E vejo a Home de login
      E altero o campo "agência" para o dado do \"#{datapool}\" \"#{key}\"
      E altero o campo "conta" para o dado do \"#{datapool}\" \"#{key}\"
      E clico no botao OK
      E vejo a tela de senha eletronica
      E digito a senha eletronica valida
      E clico no botao acessar
      Entao vejo a nova home
    )
end

def open_login_screen(datapool, key)
  steps %(
      E vejo a Home de login
      E altero o campo "agência" para o dado do \"#{datapool}\" \"#{key}\"
      E altero o campo "conta" para o dado do \"#{datapool}\" \"#{key}\"
      E clico no botao OK
      E vejo a tela de senha eletronica
      E digito a senha eletronica valida
      E clico no botao acessar
      Entao vejo a nova home
    )
end

def open_password_screen
  steps %(
      E vejo a tela de senha eletronica
      E digito a senha eletronica valida
      E clico no botao acessar
      Entao vejo a nova home
    )
end

Dado(/^que realizei login com uma "(.*?)" "(.*?)"$/) do |datapool, key|
  begin
    page(HomeNaoLogada).await(timeout: 8)
    welcome_screen_on = true
  rescue
    welcome_screen_on = false
  end

  begin
    page(NewLoginScreen).await(timeout: 8)
    login_screen_on = true
  rescue
    password_screen_on = false
  end

  begin
    page(SenhaLoginScreen).await(timeout: 8)
    password_screen_on = true
  rescue
    password_screen_on = false
  end

  $datapool_global = datapool
  $key_global = key

  if welcome_screen_on
    open_welcome_screen datapool, key
  elsif login_screen_on
    open_login_screen datapool, key
  elsif password_screen_on
    open_password_screen
  end

end

Dado(/^saio da tela de whats new$/) do
    begin
        page(WhatsNewIntroScreen).await(timeout: 2)
        whats_new_open = true
    rescue
        whats_new_open = false
    end

    @whats_new = page(WhatsNewIntroScreen)
    if whats_new_open
        @whats_new.touch_button "não, obrigado"
    end
end

Dado(/^que vejo a tela de boas vindas$/) do
  @bem_vindo_screen = Objetos.instanciar :BemVindo
  if @bem_vindo_screen.exist_welcome?
     @home = page(HomeNaoLogada).await(timeout: 5)
     @home.exist_logo_pf?
  end
end

Dado(/^vejo o titulo de bem vindo$/) do
  fail "Verificando se contem o texto seja bem vindo" if
    @home.exist_seja_bem_vindo == false
  end

Dado(/^vejo o link ja tenho uma conta$/) do
  fail "Verificando se contem o texto ja tenho uma conta" if
    @home.exist_ja_tenho == false
  end

Dado(/^vejo o link sou novo por aqui$/) do
   fail "Verificando se contem o texto sou novo aqui" if
    @home.exist_novo_aqui == false
  end

Quando(/^clico no link ja tenho uma conta$/) do
  @home = page(HomeNaoLogada).await(timeout: 5)
  if @bem_vindo_screen.exist_welcome?
     @home.touch_acessar_conta
  end
end

Quando(/^clico no link sou novo por aqui$/) do
@home.wait_for_progress
@home.touch_abrir_conta
end

Então(/^vejo a home nao logada$/) do
@page = page(NewLoginScreen).await(timeout: 8)
@page.wait_for_progress
  fail "Verificando se contem o agencia na tela" if
    @page.exist_campo_agencia == false
end

Então(/^vejo google playstore$/) do
puts "direcionado para app store"
end

## Home Logada

Dado(/^vejo a Home de login$/) do
steps %(E saio da tela de whats new)
@page = page(NewLoginScreen).await(timeout: 8)
@page.wait_for_progress
end

Dado(/^digito a agencia "([^"]*)" e conta "([^"]*)" validos$/) do |agencia, conta|
@page = page(NewLoginScreen).await(timeout: 8)
@page.digitar_agencia agencia
@page.digitar_conta conta
@page.wait_for_progress
end

Dado(/^digito a agencia "([^"]*)" e conta "([^"]*)" invalidos$/) do |agencia, conta|
@page.digitar_agencia agencia
@page.digitar_conta conta
@page.wait_for_progress
end

Dado(/^digito a agencia "([^"]*)" e conta "([^"]*)" validos com titular$/) do |agencia, conta|
@page.digitar_agencia agencia
@page.digitar_conta conta
@page.wait_for_progress
end

Dado(/^clico no botao OK$/) do
@page.click_botao_ok
end

Quando(/^clico no botao acessar$/) do
@senha.click_botao_acessar
end

Dado(/^vejo a tela de senha eletronica$/) do
@senha = page(SenhaLoginScreen).await(timeout: 8)
end

Dado(/^vejo a tela de senha com titular$/) do
@senha.head_pop_titular
end

Dado(/^vejo mensagem de erro de agencia ou conta invalidos$/) do
  @page = page(NewLoginScreen)
  @page.msg_erro_conta
end

Dado(/^vejo a tela de titulares$/) do
@titulares = page(TitularesScreen).await(timeout: 8)
end

Dado(/^clico no titular$/) do
@titulares.click_titular
end

Dado(/^clico no segundo titular$/) do
@titulares.click_titular(1)
end

Dado(/^acesso a listagem de contas de acesso rápido salvas$/) do
@senha.touch_pop_titular
end

Dado(/^seleciono a última conta de acesso rápido salva$/) do
@senha.select_saved_account @used_credential
end

Quando(/^seleciono a opção lembrar agencia e conta$/) do
@page = page(NewLoginScreen).await(timeout: 5)
@page.wait_for_progress
@page.click_botao_lembrar
end

Então(/^vejo a nova home$/) do
@page = page(NovaHome).await(timeout: 8)
@page.wait_for_progress
end

Então(/^digito a senha eletronica valida$/) do
@senha = page(SenhaLoginScreen).await(timeout: 8)
@senha.enter_password "000000"
end

# Neste caso não é a senha que esta incorreta, mas sim a agencia e conta que ja retorna do serviço a mensagem de erro de senha
Então(/^digito a senha eletronica invalida$/) do
@senha = page(SenhaLoginScreen).await(timeout: 8)
@senha.enter_password "000010"
end

# implementação dos métodos de senha esta na screen SenhaLoginScreen
Então(/^vejo mensagem de erro de senha invalida$/) do
@senha.tooltip_erro_senha
 end

# tabbar visualizando perfil de usuário e realizando logout
Então(/^clico no cabecalho para visualizar o perfil do usuario$/) do
@perfil = page(PerfilScreen).await(timeout: 8)
@perfil.click_header
@perfil.wait_for_progress
end

Então(/^faço logout$/) do
@perfil = page(PerfilScreen).await(timeout: 8)
@perfil.botao_visivel
@perfil.wait_for_progress
end
