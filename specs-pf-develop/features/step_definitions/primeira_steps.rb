# coding: utf-8
Dado(/^que vejo a tela inicial$/) do
  @primeira_screen = Objetos.instanciar :Primeira

	fail "Verificando se esta na tela inicial" if
	    @primeira_screen.is_tela_inicial == false
end

Dado(/^aperto no link ja tenho uma conta$/) do
	  @primeira_screen.touch_ja_tenho_conta
end

Dado(/^pulo o tutorial$/) do
  @primeira_screen.touch_nao_obrigado
end


Dado(/^olho a Home de login$/) do
  fail "Verificando se esta na tela inicial" if
	    @primeira_screen.is_tela_home_login == false
end

Dado(/^inputo o campo "([^"]*)" para o dado do "([^"]*)" "([^"]*)"$/) do |arg1, arg2, arg3|
	@primeira_screen.preencher_credencial_p arg3
end

Dado(/^aperto no botao OK$/) do
  
end

Então(/^observo a tela de senha eletronica$/) do
  
end


