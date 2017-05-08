class Objetos
  class << self
    def instanciar(classe)
      classe = Object.const_get classe
      classe.instance
    end
  end
end