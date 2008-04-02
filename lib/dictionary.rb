class Dictionary
  def initialize store, cache
    @cache = cache
    @store = store
  end
  
  def lookup key
    value = @cache.get key
    return value unless value.nil?
    @store.get key
  end
end