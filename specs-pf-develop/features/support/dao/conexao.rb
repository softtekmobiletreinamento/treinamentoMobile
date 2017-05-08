require 'mongo'

class Conexao
  include Singleton

  attr_reader :db

  def initialize
    abrir_conexao
  end

  def abrir_conexao
    ambiente = $AMBIENTE
    config = CONFIGURACAO[ambiente.to_sym]
    # server = 'localhost:27017'
    # server = '10.56.147.16:37017'
    server = config[:datapool_server]

    #client = Mongo::Client.new([server], :min_pool_size => 5, :max_pool_size => 10, :database => 'mobile_datapool')
    client = Mongo::Client.new([server], :min_pool_size => 5, :max_pool_size => 10, :database => config[:database])
    @db = client.database
  end

  private :abrir_conexao
end