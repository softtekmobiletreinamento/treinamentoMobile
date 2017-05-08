class Datapool
  @@datapool = Hash.new

  def self.init()
    @@datapool.merge!(yield) { raise 'O datapool não pode ter chaves duplicadas'}
  end
  
  def self.get_datapool_value(datapool, key = nil, field = nil)
    return @@datapool[datapool] if key.nil?
    return @@datapool[datapool][key] if field.nil?
    return @@datapool[datapool][key][field]
  end
end