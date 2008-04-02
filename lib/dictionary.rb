class Dictionary
  def initialize store, cache
    @cache = cache
    @store = store
  end
  
  def lookup key
    @cache.get key
    @store.get key
  end
end