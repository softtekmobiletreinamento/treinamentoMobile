require 'pry'
require 'singleton'

if ENV['PLATFORM'] == 'ios'
  require 'calabash-cucumber/cucumber'
	require 'ios/helpers/ios_helper'
elsif ENV['PLATFORM'] == 'android'
  require 'calabash-android/cucumber'
	require 'android/helpers/android_helper'
end

require_relative '../modules/screens_objects'

$SO = ENV['PLATFORM']

$AMBIENTE = ENV['ENVIRONMENT']
if ENV['ENVIRONMENT'].nil?
	$AMBIENTE = 'mock'
end

$Erros = Array.new

at_exit do
  result=$Erros.group_by(&:classe).map do |token, with_same_token|
		[token, with_same_token.map(&:mensagem), with_same_token.size]
	end
	puts "Mapa de Erros"
	puts "============================="
	for err in result do
		puts "Erro de " + err.first.to_s + " > " + err.last.to_s
	end

end

# Takes screenshots after every step
# AfterStep do
#   screenshot_embed
# end
