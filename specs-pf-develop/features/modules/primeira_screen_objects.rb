# testando os conhecimentos

module PrimeiraScreenObjects
  include ScreensObjects

  def touch_ja_tenho_conta
    tocar_elemento @botao_ja_tenho_uma_conta_itau
    puts "primeiro passo na botao_ja_tenho_uma_conta_itau"
  end

  def touch_nao_obrigado
    tocar_elemento @botao_nao_obrigado
    puts "primeiro passo na botao_nao_obrigado"
  end

  def preencher_credencial_p(credencial)
    sleep(4)
    # Chamada ao datapool
    #@documento = buscar_documento('credenciais', tipo: credencial)
    #agencia = @documento['agencia']
    #conta = @documento['conta']
    @documento = CREDENTIALS[credencial.gsub(' ', '_').to_sym]
    agencia = @documento[:agency]
    conta = @documento[:account]

    resposta = tocar_digitar_texto @elemento_agencia, agencia
    mensagem_erro = "#{ERRO_DIGITAR_TEXTO} #{@campo_agencia}"
    fail mensagem_erro unless resposta[:status].eql?(true)
    resposta = tocar_digitar_texto @elemento_conta, conta, 10
    mensagem_erro = "#{ERRO_DIGITAR_TEXTO} #{@campo_conta}"
    fail mensagem_erro unless resposta[:status].eql?(true)
  end
end