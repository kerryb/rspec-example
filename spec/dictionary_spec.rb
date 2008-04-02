require 'spec'
$: << File.dirname(__FILE__) + '/../lib'
require 'dictionary'

describe Dictionary, "looking up a value" do
  before do
    @store = mock 'store'
    @cache = mock 'cache'
    @key='foo'
    @cached_value = 'cached foo'
    @stored_value = 'stored foo'
    @cache.stub!(:get).and_return @cached_value
    @store.stub!(:get).and_return @stored_value
    @dictionary = Dictionary.new(@store, @cache)
  end
  
  it "should look in the cache" do
    @cache.should_receive(:get).with @key
    @dictionary.lookup @key
  end
  
  describe "when the value is in the cache" do
    before do
      @cache.stub!(:get).and_return @cached_value
    end
    
    it "should return the value returned from the cache" do
      @dictionary.lookup(@key).should == @cached_value
    end
  
    it "should not look in the store" do
      @store.should_not_receive(:get)
    end
  end
  
  describe "when the value is not in the cache" do
    before do
      @cache.stub!(:get).and_return nil
    end

    it "should look in the store" do
      @cache.stub!(:get).and_return nil
      @store.should_receive(:get).with @key
      @dictionary.lookup @key
    end
    
    it "should return the value returned from the store" do
      @dictionary.lookup(@key).should == @stored_value
    end
  end
end