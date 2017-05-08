After do |scenario|
  # Do something after each scenario.
  # The +scenario+ argument is optional, but
  # if you use it, you can inspect status with
  # the #failed?, #passed? and #exception methods.

hide_soft_keyboard() if $SO == 'android'


if scenario.failed?
		exceptionClass = scenario.exception.class.to_s
		exceptionMessage = scenario.exception.message.to_s.downcase
		_erro = Struct.new(:classe, :mensagem)
		$Erros << _erro.new(exceptionClass, exceptionMessage)
    
 end

end