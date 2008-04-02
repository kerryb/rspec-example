class Dictionary
  def initialize store, cache
    @cache = cache
    @store = store
  end
  
  def lookup key
    value = @cache.get key
    if value.nil?
      value = @store.get key
    end
    raise 'Not found' if value.nil?
    return value
  end
end