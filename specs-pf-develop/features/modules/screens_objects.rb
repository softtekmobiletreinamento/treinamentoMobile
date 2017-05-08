# Módulo de ações responsável por agrupar os
# métodos de suporte aos módulos de screen

module ScreensObjects
  include ConstantesMensagem

  def elementos_existem?(elementos)
    elementos.each do |chave|
      elemento = chave[:elemento]
      valor = chave[:valor]
      propriedade = chave[:propriedade]
      mensagem_erro = "Elemento: '#{elemento}' com o valor '#{valor}' não foi localizado"

      resposta = buscar_elemento(elemento, 10)[0][propriedade]

      raise mensagem_erro unless valor.eql? resposta
    end
  end

  def se_tela_existir_toca_objeto(tela, objeto, timeout = 10)
    tela_carregou = tela_carregou? tela, timeout
    if tela_carregou[:status].eql?(true)
      resposta = tocar_elemento objeto, timeout
      mensagem_erro = "#{ERRO_TOCAR_ELEMENTO} #{objeto}"
      valida_status_metodo(mensagem_erro, resposta)
    end
  end

  def valida_status_metodo(mensagem_erro, resposta)
    if status_ok? resposta
      resposta[0]
    else
      fail mensagem_erro
    end
  end

  def tela_carregou_retorna_falha(tela, timeout = 5)
    resposta = tela_carregou? tela, timeout
    mensagem_erro = "#{ERRO_CARREGAR_TELA} #{tela}"
    valida_status_metodo(mensagem_erro,resposta)
  end

  def toca_elemento_retorna_falha(elemento, timeout = 5)
    procura_elemento(elemento, :para_cima, 10)
    resposta = tocar_elemento elemento, timeout
    mensagem_erro = "#{ERRO_TOCAR_ELEMENTO} #{elemento}"
    valida_status_metodo(mensagem_erro,resposta)
  end

  def elemento_existe_retorna_falha(elemento, timeout = 5)
    resposta = buscar_elemento elemento, timeout
    mensagem_erro = "#{CONSULTA_VAZIA} #{elemento}"
    valida_status_metodo(mensagem_erro,resposta)
  end

  def procura_elemento(elemento, direcao, qtde_tentativas = 10)
    (1..qtde_tentativas).each do
      resposta = buscar_elemento elemento, 3
      if status_ok? resposta
        break
      else
        deslizar_devagar(nil, direcao)
      end
    end
  end
end