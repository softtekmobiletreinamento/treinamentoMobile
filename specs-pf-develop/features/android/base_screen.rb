class BaseScreen < AndroidScreenBase

# Declare todos os elementos de botoes aqui
   # element(:btn_registerEmail)        { 'buttonConnectWithMoneyLover' }
   # element(:edit_txtEmail)            { 'etEmail' }

def self.element_with_alias(element_alias, &block)
   define_method(element_alias) { block.call }
end

def clicar_btn(btn)
    tap_when_element_exists("* id:'#{btn}'")
    sleep(2)
end

def preencher_form(txt_value, edit_field)
    touch_screen_element edit_field
    keyboard_enter_text(txt_value)
    hide_soft_keyboard()
end

def check_element(element)
    check_element_exists(element)
end

def check_element_does_not_exist(element)
    check_element_does_not_exist(element)
end

def touch_element(selector)
    touch_screen_element(selector)
end

end
