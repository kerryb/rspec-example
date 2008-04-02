class CachedStore
  def initialize
    @values = {}
  end
  
  def get key
    @values[key]
  end
  
  def set key, value
    @values[key] = value
  end
  
  def empty?
    @values.empty?
  end

  def size
    @values.size
  end
end