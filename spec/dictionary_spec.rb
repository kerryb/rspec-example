require 'spec'
$: << File.dirname(__FILE__) + '/../lib'
require 'dictionary'

describe Dictionary, "looking up a value" do
  it "should look in the cache" do
    store = mock 'store'
    cache = mock 'cache'
    key='foo'
    dictionary = Dictionary.new(store, cache)
    cache.should_receive(:get).with(key)
    dictionary.lookup key
  end
end