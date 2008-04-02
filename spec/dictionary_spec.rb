require 'spec'
$: << File.dirname(__FILE__) + '/../lib'
require 'dictionary'

describe Dictionary, "looking up a value" do
  before do
    @store = mock 'store'
    @cache = mock 'cache'
    @key='foo'
    @value = 'bar'
    @cache.stub!(:get).and_return @value
    @dictionary = Dictionary.new(@store, @cache)
  end
  
  it "should look in the cache" do
    @cache.should_receive(:get).with(@key)
    @dictionary.lookup @key
  end
  
  it "should return the value returned from the cache" do
    @dictionary.lookup(@key).should == @value
  end
end