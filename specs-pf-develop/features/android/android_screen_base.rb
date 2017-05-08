require 'calabash-android/abase'
require 'date'
class AndroidScreenBase < Calabash::ABase
  def self.element(element_name, &block)
    define_method(element_name.to_s, *block)
  end
  class << self
    alias_method :value, :element
    alias_method :action, :element
    alias_method :trait, :element
  end
  element(:loading_screen)        { 'loading' }
  element(:loading_progress_bar)  { 'progress_bar' }
  # The progress bar of the application is a custom view
  def wait_for_progress
    sleep 2
    wait_for_element_does_not_exist("* id:'#{loading_screen}'",
                                    timeout: 60)
  end
  def wait_for_progress_bar
    sleep 2
    wait_for_element_does_not_exist("* id:'#{loading_progress_bar}'",
                                    timeout: 60)
  end
  element(:open_menu_button)         { "* marked:'abrir menu'" }
  element(:close_menu_button)        { "* marked:'fechar menu'" }
  element(:bt_stop_here)             { 'Parar Aqui' }
  element(:bt_go_now)                { 'Ir Agora!' }
  @@menu_aberto = false

  def used_credential
    @used_credential
  end

  # Touch the menu icon to open the menu
  def open_menu
    sleep 2
    @@menu_aberto = element_exists close_menu_button
    if ! @@menu_aberto
      touch_screen_element 'Open Menu Button', open_menu_button
      @@menu_aberto = true
      else
      touch_screen_element 'Close Menu Button', close_menu_button
      @@menu_aberto = false
    end
  end
  # Perform a drag action from the right to the left side
  # to close the menu
  def close_menu
    touch_screen_element 'Close menu Button', close_menu_button
  end
  element(:menu_item_about)     { 'button_about' }
  def menu_itens_visible?
    sleep 1
    element_exists "* id:'#{menu_item_about}'"
  end

  def has_text?(text)
    !query("* {text CONTAINS[c] '#{text}'}").empty? ||
      !query("* {accessibilityLabel CONTAINS[c] '#{text}'}").empty?
  end

  def drag_to(direction)
    positions = [0,0,0,0] # [ 'from_x', 'to_x', 'from_y', 'to_y' ]
    case(direction)
    when :down
      positions = [1,1,60,30]
    when :up
      positions = [1,1,60,90]
    when :left
      positions = [90,20,80,80]
    when :right
      positions = [20,90,80,80]
    end
    # perform_action( 'action', 'from_x', 'to_x', 'from_y', 'to_y',
    # 'number of steps (in this case, velocity of drag' )
    perform_action('drag', positions[0], positions[1],
                   positions[2], positions[3], 15)
    sleep(1)
  end
  def drag_until_element_is_visible_with_special_query(direction, element)
    drag_until_element_is_visible direction, element,
                                  "* {text CONTAINS[c] '#{element}'}"
  end

  def drag_until_element_is_visible(direction, element, query = nil, timeout = 30)
    hide_soft_keyboard if keyboard_visible?
    query = "* marked:'#{element}'" if query.nil?

    wait_poll(until_exists: query, timeout: timeout,
      timeout_message: "Elemento '#{element}' não foi encontrado na tela!") do
      drag_to direction
    end
  end

  def drag_to_slow(direction)

    positions = [0,0,0,0]

    case(direction)
      when :down
        positions = [30,30,40,30]
      when :up
        positions = [80,80,80,90]
      when :left
        positions = [90,50,80,80]
      when :right
        positions = [50,90,80,80]
    end

    # perform_action( 'action', 'from_x', 'to_x', 'from_y', 'to_y',
    # 'number of steps (in this case, velocity of drag' )
    perform_action('drag', positions[0], positions[1],
                   positions[2], positions[3], 15)
  end

  def drag_until_element_is_visible_slow(direction, query, timeout = 30)
    begin
      wait_poll(until_exists: query, timeout: timeout) do
        drag_to_slow direction
      end
    rescue
      raise "Elemento '#{element}' não foi encontrado na tela!"
    end
  end

  def drag_for_specified_number_of_times(direction, times)
    times.times do
      drag_to direction
    end
  end

  def drag_until_element_is_visible_webview(direction, tag, element, query = nil, timeout = 30)
    query = "webview css:'#{tag}' { html CONTAINS '#{element}'}" if query.nil?

    begin
      wait_poll(until_exists: query, timeout: timeout) do
        drag_to direction
      end
    rescue
      raise "Elemento '#{element}' não foi encontrado na tela!"
    end
  end

  # Negation indicates that we want a page that doesn't
  # has the message passed as parameter
  def is_on_page?(page_text, negation = '')
    fail 'Página inesperada. Entre com uma mensagem válida' if
        page_text.to_s == ''

    should_not_have_exception = false
    should_have_exception = false
    begin
      wait_for(timeout: 10) { has_text? page_text }
      # If negation is not nil, we should raise an error
      # if this message was found on the view
      should_not_have_exception = true unless negation == ''
    rescue
      # only raise exception if negation is nil,
      # otherwise this is the expected behaviour
      should_have_exception = true if negation == ''
    end

    fail "Página inesperada. A página não contém: '#{page_text}'" if
      should_not_have_exception

    fail "Página inesperada. Era esperado: '#{page_text}'" if
      should_have_exception

    true
  end

  def enter(text, element, query = nil)
    sleep 1
    query = "* marked:'#{element}'" if query.nil?
    begin
      wait_for(timeout: 5) { element_exists query }
      query(query, setText: text)
    rescue
      raise "Campo de texto '#{element}' não encontrado na tela"
    end
  end
=begin

ESTE CÓDIGO FOI ADICIONADO RECENTEMENTE, PORÉM AO EXECUTAR O PROJETO REDESIGN, NÃO PASSOU.
INSERIMOS O CODIGO ANTIGO QUE FUNCIONAVA, EMBAIXO DESSE MÉTODO, PARA O SQT ANALISAR QUAL METODO DEVERÁ FICAR

  def enter_password(senha)

    senhas = []

    # procura na tela cada digito da senha informada
    senha.split('').each do |digito|

      # consulta o array 'senhas' verificando se para o digito informado, já existe uma posição conhecida
      # caso sim, retorna a posição para efetuar a ação tocar na tela
      # caso não, busca na tela o botão que contém o digito informado para depois efetuar a ação tocar na tela
      hash_digito = senhas.find { |_digito| _digito[:digito] == digito }
      if !hash_digito.nil?
        x = hash_digito[:x]
        y = hash_digito[:y]
      else
        # busca na tela o botão que contém na descrição do digito da senha informada
        elemento = query "android.widget.Button {text CONTAINS[c] '#{digito}'}"

        # retorna as coordenadas do botão que contém o digito da senha informada
        x = elemento[0]['rect']['x']
        y = elemento[0]['rect']['y']

        # para os posições já encontrados, armazena em no array 'senhas' a posição na tela
        digito1 = elemento[0]['text'].split('').first
        senhas.push({:digito => digito1, :x => x, :y => y})

        digito2 = elemento[0]['text'].split('').last
        senhas.push({:digito => digito2, :x => x, :y => y})
      end

      touch(nil, { offset: { x: x.to_i, y: y.to_i }})
    end
  end
=end

#METODO ANTIGO QUE FUNCIONAVA
def enter_password(password)
  sleep 2
  password.split('').each do |number|
    # No teclado virtual, o numero pode vir antes ou depois do texto 'ou', ex.: '0 ou 1'
    if element_exists("android.widget.TextView {text CONTAINS[c] 'ou #{number}'}")
      touch("android.widget.TextView {text CONTAINS[c] 'ou #{number}'}")
    elsif element_exists("android.widget.TextView {text CONTAINS[c] '#{number} ou'}")
      touch("android.widget.TextView {text CONTAINS[c] '#{number} ou'}")
    else
      fail 'Número não encontrado na tela'
    end
  end
end

  def touch_screen_element(element, query = nil, timeout = 5)
    query = "* id:'#{element}'" if query.nil?
    begin
      wait_for(timeout: timeout) { element_exists(query) }
      touch(query)
    rescue => e
      raise "Problema em tocar no elemento da tela: '#{element}'\nMensagem de erro: #{e.message}"
    end
  end

  def touch_element_by_text(text)
    wait_for(timeout: 5) { element_exists("* text:'#{text}'") }
    touch("* text:'#{text}'")
  end

  def touch_element_by_index(id, index)
    wait_for(timeout: 5) { element_exists("* id:'#{id}' index:#{index}") }
    touch("* id:'#{id}' index:#{index}")
  end

  def clear_text_field(field)
    clear_text_in("android.widget.EditText id:'#{field}'}")
  end

  def select_date_on_date_picker(date, date_picker_field_id)
    # Touch the date picker field
    touch "* id:'#{date_picker_field_id}'"
    # Setting the date
    set_date 'DatePicker', date.year, date.month, date.day
    # Clicking in the Done button
    touch "* id:'button1'"
  end

  # This method uses 'query "*", :getError' to return an error array
  # When a position has the right message it returns true
  # Use this method when using the Android setError method
  # This method uses 'query "*", :getError' to return an error array
  # When a position has the right message it returns true
  # Use this method when using the Android setError method
  def error_message_visible?(message)
    error_messages = query '*', :getError
    fail "A mensagem:'#{message}' não está visível" unless
       error_messages.include? message.to_s
  end

  def valida_mensagem_critica_rodape(message)

    wait_for_progress
    query_exec = "android.support.v7.widget.AppCompatTextView {text CONTAINS[c] '#{message}'}"
    retorno = element_exists(query_exec)

    if retorno == false
       mensagem = "A mensagem: '#{message}' não está visível"
       fail(ArgumentError.new(mensagem))
    end
  end

  def tentativas_mensagem_rodape(message, tentativas)
    i = 0
    while i < tentativas
      begin
        wait_for(timeout:5) {element_exists("* text:'#{message}'")}
        break
      rescue
        i = i + 1
        touch_element_by_text "continuar"
      end
    end
  end

  def voucher_dates
    dates = []
    query("* id:'#{date_field}'", :text).each do |date_string|
      if date_string.to_i == 0
        next
      end
      day, month, year = (date_string.gsub(/[A-z]+\s/,'')).split('/')
      dates << Date.new(year.to_i, month.to_i, day.to_i)
    end
    dates
  end

  def dates_ordered?(dates, order)
    case order
      when :asc
        return dates.each_cons(2).all? { |i, j| i <= j }
      when :desc
        return dates.each_cons(2).all? { |i, j| i >= j }
    end
    false
  end

  def check_dates_order(order)
    fail 'Não existem comprovantes!' unless
        at_least_one_voucher?
    dates = voucher_dates
    dates_history = nil
    # Drags the screen down until the end
    # Dates and dates_history are used to know when the scroll is not changing
    # the values of dates
    while dates != dates_history
      fail "Datas não estão na ordem #{order}!" unless
          dates_ordered?(dates, order)
      drag_to :down
      dates_history = dates
      dates = voucher_dates
    end
  end

  def check_dates_period(period)
    fail 'Não existem comprovantes!' unless
        at_least_one_voucher?
    dates = voucher_dates
    dates_history = nil
    last_date = initial_date - period
    while dates != dates_history
      dates.each do |date|
        fail "Essas datas estão fora do periodo de #{period} dias" if
            date > initial_date || date < last_date
      end
      drag_to :down
      dates_history = dates
      dates = voucher_dates
    end
  end

  def close_labels
    #not implemented yet
  end

  def method_missing(method, *args)
    if method.to_s.start_with?('touch_')
      # If method name starts with touch_, executes the touch
      # screen element method using the element name which is the
      # method name without the first 'touch_' chars
      touch_screen_element public_send(method.to_s.gsub('touch_', ''))
    elsif method.to_s.start_with?('enter_')
      # If method starts with enter_, execute the enter method using
      # the field name, which is the method name without the initial
      # 'enter_' chars and appended '_field' chars
      enter args[0], public_send("#{method.to_s.gsub('enter_', '')}_field")
    elsif method.to_s.end_with?('_visible?')
      # If method ends with _visible?, executes the visible? method
      # The field name is the method name without de ending
      # '_visible? chars
      visible? public_send(method.to_s.gsub('_visible?', ''))
    else
      super
    end
  end

  def visible?(id, query = nil)
    query = "* id:'#{id}'" if query.nil?
    begin
      wait_for(timeout: 3) { element_exists query }
    rescue
      return false
    end
    true
  end

  element(:token_aplicativo_button)         { 'aplicativo_token_type' }
  element(:token_sms_button)                { 'sms_token_type' }
  element(:token_chaveiro_button)           { 'chaveiro_token_type' }
  element(:token_field)                     { 'token_number_edit' }
  element(:token_ok_button)                 { 'token_primary_action' }
  element(:token_ok_button_err)             { 'button1' }

  def enter_token(type, value)
    touch_screen_element public_send("token_#{type}_button")
    enter value, token_field
    touch_screen_element token_ok_button
    wait_for_progress
  end

  def enter_token_sms(token)
    touch_screen_element token_app_button
    enter token, token_field
    touch_screen_element token_ok_button
    wait_for_progress
  end

  element(:play_services_button)            { "* id:'button1'" }
  # if the element does not exist "wait_for" throws an exception, doenst use in this case
  def close_alerts
    begin
     wait_for(timeout: 5, screenshot_on_error:false)  {element_exists play_services_button}
     touch(play_services_button) {element_exists play_services_button}
    rescue Calabash::Android::WaitHelpers::WaitError => ex
    end
  end

  ############ CI&T ##########

  def touch_button(element_alias)
    if element_alias.downcase == BACK_BUTTON
      press_back_button
    else
      element_id = get_element_id(element_alias)

      wait_for(timeout: 5, timeout_message: "Botão '#{element_alias}' não foi encontrado na tela") do
        if !element_id.nil?
          query_element = "* id:'#{element_id}'"
          drag_until_element_is_visible(:down, nil, query_element)
          touch query_element
          return true
        else
          query_element = "* text:'#{element_alias}'"
          drag_until_element_is_visible(:down, nil, query_element)
          touch query_element
          return true
        end

        return false
      end
    end
  end

  TYPE_SUFIX = "_type"

  def self.element_with_alias(element_alias, element_name, type = TYPE[:Field], &block)
    element(element_name) { block.call }

    method = element_alias.to_s.gsub(/[^0-9A-Za-z]/, '_')
    define_method(method) { block.call }
    define_method(method + TYPE_SUFIX) { type }
  end

  def get_element_id(element_alias)
    method = element_alias.to_s.gsub(/[^0-9A-Za-z]/, "_") # e_mail
    if respond_to? method
      send(method)
    else
      return nil
    end
  end

  def get_element_type(element_alias)
    method = element_alias.to_s.gsub(/[^0-9A-Za-z]/, '_') + TYPE_SUFIX
    if respond_to? method
      send(method)
    else
      return nil
    end
  end

  def enter_by_keyboard(text, element, query = nil, back = true)
    if query.nil?
        touch_screen_element(element)
    else
        touch_screen_element(nil, query)
    end
    keyboard_enter_text(text)
    sleep(1)
    if back
      press_back_button
    end
  end

  def drag_until_element_is_visible_by_description(direction, description, element, query = nil, timeout = 30)
    query = "* marked:'#{element}'" if query.nil?

    begin

      test = lambda do
        if (element_exists(query))
          found = query(query).select {|item|
            get_description(item["description"]) == get_description(description)
          }
          found.any?
        else
          false
        end
      end

      wait_poll(until: test, timeout: timeout) do
        drag_to direction
      end
    rescue
      raise "Elemento com a descrição' '#{description}' não encontrado na tela!"
    end
  end

  def get_element_by_description(q, description)
    elements =  query(q)

    if (element.any?)
      if elements.size == 1 && get_description(elements.first["description"]) == get_description(description)
        elements.first
      else
        element = nil

        elements.each do |item|
          if get_description(item ["description"]) == get_description(description)
            element = item
            break
          end
        end

        fail "Elemento com a descrição' '#{description}' não encontrado na tela!" if element.nil?

        element
      end
    else
      fail "Elemento com a descrição' '#{description}' não encontrado na tela!"
    end
  end

  def get_description(description)
    /(.*) VFED/.match(description)[0]
  end

  def set_field(element_alias, text, index = -1)
    idx = index

    if idx >= 0
      all_elements = query("all * id:'#{get_element_id(element_alias)}'")

      description = get_description(all_elements[idx]["description"]);

      begin
        drag_until_element_is_visible_by_description(:up, description, get_element_id(element_alias))
      rescue
        drag_until_element_is_visible_by_description(:down, description, get_element_id(element_alias))
      end

      elements = query("* id:'#{get_element_id(element_alias)}'")

      elements.each_with_index do |item, i|
        itemArray = get_description(item["description"])

        if itemArray == description
          idx = i
          break
        end
      end
    else
      begin
        drag_until_element_is_visible(:up, get_element_id(element_alias))
      rescue
        drag_until_element_is_visible(:down, get_element_id(element_alias))
      end

      idx = 0
    end

    q = "* id:'#{get_element_id(element_alias)}' index:#{idx}"

    case get_element_type(element_alias)
    when TYPE[:Field]
      query(q, setText: "")

      enter_by_keyboard text, nil, q, false

      hide_soft_keyboard if keyboard_visible?
    when TYPE[:Selector]
      select_item_from_spinner("android.widget.AbsListView index:0 * text:'#{text}'", {:spinner => "android.widget.AbsSpinner id:'#{get_element_id(element_alias)}' index:#{idx}"})
    else
      raise "Campo '#{element_alias}' possui um tipo desconhecido"
    end
  end

  def set_field_recursive(field, value, index = -1)
    unless value.is_a?(Array)
      set_field(field, value, index)
    else
      value.each_with_index { |val, i|
        if val.is_a?(Hash)
          val.each { |f, v| set_field_recursive(f, v, i)}
        else
          fail "datapool inválido' #{field}"
        end
       }
    end
  end

  def datapool_set_field(datapool, key, field = nil)
      if field.nil?
        $datapool[datapool][key].each { |f, v| set_field_recursive(f, v) }
      else
        set_field_recursive(field, Datapool.get_datapool_value(datapool, key, field))
      end
  end

  def check_element_is_enabled(element_alias, expected_enabled)
    begin

      element = get_element_id(element_alias) || element_alias

      drag_until_element_is_visible(:down, element)
      element_list = query("* marked:'#{element}'")
      actual_enabled = element_list.first["enabled"]
    rescue
      raise "Elemento #{element_alias} não encontrado na tela"
    end

    raise "O elemento ativado é '# {actual_enabled}', mas espera-se que seja '# {expected_enabled}'" unless (expected_enabled == actual_enabled)
  end

  def touch_item(item)
    drag_until_element_is_visible(:down, item)
    touch "* marked:'#{item}'"
  end

  def checkbox_is_checked(element_alias, expected_enabled)
    begin
      begin
        element = get_element_id(element_alias)
      rescue
        element = element_alias
      end

      drag_until_element_is_visible(:down, element)

      actual_enabled = query("* marked:'#{element}'").first["checked"]
    rescue
      raise "Elemento #{element_alias} não encontrado na tela"
    end

    raise "Elemento habilitado é '#{actual_enabled}', mas o esperado era '#{expected_enabled}'" unless
        (expected_enabled == actual_enabled)
  end



  ###Screen da antiga feature Menu


  element(:voucher_menu_item)   { "* id:'text_menu_name' text:'comprovantes'" }
  element(:exit_menu_item)      { "* id:'text_menu_name' text:'sair'" }

  # Declare todas as ações da tela
  def touch_menu_item(item)
    menu_item_query = "* id:'text_view_menu_second_level_title' text:'#{item}'"
    touch_screen_element("Menu item: '#{item}'", menu_item_query) if menu_item_visible?(item)
  end

  def menu_item_visible?(item)
    menu_item_query = "* id:'text_view_menu_second_level_title' text:'#{item}'"
    # Scroll the screen until the element is visible
    begin
      drag_until_element_is_visible :down, "Menu item: '#{item}'",
                                    menu_item_query
    rescue
      return false
    end
    true
  end

  def by_pass_dialog_message()
    step "toco no botão \"ok, entendi\""
  end

  #Retorna a posição 'parameter'referente ao objeto 'query'
  #Exemplo: query = "* id: 'botao_x'" e parameter 'y' retorna a posição y do objeto botao_x
  def get_rect_parameter(query, parameter)
      query("#{query}").map { |result| result["rect"]["#{parameter}"] }
  end

  def touch_stop_here
    webview = Objetos.instanciar :Webview
    webview.tocar_botao_parar_aqui
  end

  def touch_go_now
    webview = Objetos.instanciar :Webview
    webview.tocar_botao_ir_agora
  end

  element(:ajuda)                                           { 'typefaced_need_help' }

  def touch_ajuda
     wait_for_progress
     drag_until_element_is_visible(:down, ajuda)
     touch_screen_element (ajuda)
  end

  def touch_webview_id_nodeName(nodeName,id, timeout = 30)
     wait_for(timeout: timeout) { element_exists("webview css:'#{nodeName}' id:'#{id}'") }
     touch("webview css:'#{nodeName}' id:'#{id}'")
  end

  def touch_webview_id(id)
    touch("webView css:'##{id}'")
  end

  def touch_webview_text_content(nodeName,text, timeout = 60)
   wait_for(timeout: timeout) { element_exists("webview css:'#{nodeName}' textContent:'#{text}'") }
   touch("webview css:'#{nodeName}' textContent:'#{text}'")
  end

  def enter_text_webview_id(text,id)
    enter_by_keyboard(text, nil, "webView css:'##{id}'", TRUE)
  end

  def clear_text_webview_id(id)
    touch("webView css:'##{id}'")
    clear_text("webView css:'##{id}'")
  end
  def element_exists_webview_id(id, timeout = 10)
    wait_for(timeout: timeout) { element_exists("webView css:'##{id}'") }
  end

  def combo_box_webview(id,texto)
    touch("webView css:'select' {html CONTAINS '#{id}'}")
    touch("* text:'#{texto}'")
  end

  def text_content_exists_webview(nodeName, text, timeout = 10)
    begin
      wait_for(timeout: timeout) { element_exists("webview css:'#{nodeName}' textContent:'#{text}'") }
    rescue
      return false
    end
    return true
  end

  def element_does_not_exist_webview_id(id, timeout = 10)
    wait_for(timeout: timeout) { element_does_not_exist("webView css:'##{id}'") }
  end
  def text_contains_webview(text, timeout = 10)
    wait_for(timeout: timeout) { element_exists("webview css:'html' {html CONTAINS '#{text}'}") }
  end
  def message_bellow_input_field_exists(message, timeout = 10)
    @messages = CREDENTIALS[message.gsub(' ', '_').to_sym]
    query = "* {error CONTAINS[c] '#{@messages}'}"
    wait_for(timeout: timeout) { element_exists(query) }
  end
  def touch_menu_item_slow_swipe(item, quant_tentativas = 10, timeout = 10)
    wait_for(timeout: timeout) {element_exists(open_menu_button)}
    touch(open_menu_button)
    menu_item_query = "* id:'text_menu_name' text:'#{item}'"
    $i =1
    while $i < quant_tentativas  do
      if element_exists(menu_item_query)
        touch_screen_element("Menu item: '#{item}'", menu_item_query)
        $i = quant_tentativas
      else
        $i +=1
        perform_action('drag',30,30,40,30,15)
      end
    end
  end
  action(:touch_hide_virtual_keyboard) do
    touch_screen_element hide_keyboard_button
  end
  def drag_until_element_is_visible_webview_id(direction, id, timeout = 30)
    query = "webview css:'##{id}'" if query.nil?
    begin
      wait_poll(until_exists: query, timeout: timeout) do
        drag_to direction
      end
    rescue
      raise "Elemento '#{element}' não foi encontrado na tela!"
    end
  end

# Redesign
  def get_month(mes)
    month = '~'
    case mes.downcase
      when 'janeiro'
        month = 'January'
      when 'fevereiro'
        month = 'February'
      when 'março'
        month = 'March'
      when 'abril'
        month = 'April'
      when 'maio'
        month = 'May'
      when 'junho'
        month = 'June'
      when 'julho'
        month = 'July'
      when 'agosto'
        month = 'August'
      when 'setembro'
        month = 'September'
      when 'outubro'
        month = 'October'
      when 'novembro'
        month = 'November'
      when 'dezembro'
        month = 'December'
    end
    month
  end

 def message_visible?(message)
    wait_for_progress
    fail "A mensagem:'#{message}' não está visível" unless
      element_exists "* text:'#{message}'"
  end

  def input_value(id, value)
    touch_screen_element id
    keyboard_enter_text(value)
    hide_soft_keyboard()
  end
end
