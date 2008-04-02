class Dictionary
  def initialize store, cache
    @cache = cache
  end
  
  def lookup key
    @cache.get key
  end
end