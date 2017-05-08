require_relative '../../modules/primeira_screen_objects'

# Primeira implementação seguinte o framework

class Primeira < AndroidHelper
  include Singleton
  include ScreensObjects
  include PrimeiraScreenObjects

  def initialize
    # ---------------------- elementos da tela ----------------------
    @layout = "* id:'activity_redesign_welcome'"

    @botao_ja_tenho_uma_conta_itau = "* id:'txt_have_account'"
    @botao_nao_obrigado = "* id:'skip_button'"
    @elemento_bem_vindo = "* id:'textview_welcome'"
    @elemento_home_login = "* id:'relative_login_content'"
    @elemento_agencia = "* id:'txt_agency'"
    @elemento_conta = "* id:'txt_account'" 

    @botao_sou_novo_por_aqui = "* id:'txt_new_here'"
  end

  def is_tela_inicial
    sleep(4)
    element_exists @elemento_bem_vindo
    #puts element_exists @elemento_bem_vindo
  end

  def is_tela_home_login
    sleep(4)
    element_exists @elemento_home_login
    #puts element_exists @elemento_home_login
  end
  
  

end