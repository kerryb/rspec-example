class Dictionary
  def initialize store, cache
    @cache = cache
    @store = store
  end
  
  def lookup key
    value = @cache.get key
    if value.nil?
      value = @store.get key
      raise 'Not found' if value.nil?
      @cache.set key, value
    end
    return value
  end
  
  def store key, value
    @cache.set key, value
    @store.set key, value
  end
end