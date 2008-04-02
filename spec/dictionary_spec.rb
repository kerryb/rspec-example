require 'spec'
$: << File.dirname(__FILE__) + '/../lib'
require 'dictionary'

describe Dictionary do
  before do
    @store = mock 'store'
    @cache = mock 'cache'
    @cache.stub! :set
    @store.stub! :set
    @key='foo'
    @dictionary = Dictionary.new(@store, @cache)
  end
  
  describe "looking up a value" do
    before do
      @cached_value = 'cached foo'
      @stored_value = 'stored foo'
      @cache.stub!(:get).and_return @cached_value
      @store.stub!(:get).and_return @stored_value
    end
  
    it "should look in the cache" do
      @cache.should_receive(:get).with @key
      @dictionary.lookup @key
    end
  
    describe "when the value IS in the cache" do
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
  
    describe "when the value is NOT in the cache" do
      before do
        @cache.stub!(:get).and_return nil
      end

      it "should look in the store" do
        @cache.stub!(:get).and_return nil
        @store.should_receive(:get).with(@key).and_return @stored_value
        @dictionary.lookup @key
      end
    
      it "should store the value in the cache" do
        @cache.should_receive(:set).with(@key, @stored_value)
        @dictionary.lookup @key
      end        
    
      it "should return the value returned from the store" do
        @dictionary.lookup(@key).should == @stored_value
      end
    
      it "should raise an error if the value is not in the store either" do
        @store.stub!(:get).and_return nil
        lambda{@dictionary.lookup@key}.should raise_error
      end
    end
  end

  describe "Adding a value" do    
    it "should put it in the cache" do
      @cache.should_receive(:set).with(@key, @value)
      @dictionary.store @key, @value
    end
    
    it "should put it in the store" do
      @store.should_receive(:set).with(@key, @value)
      @dictionary.store @key, @value
    end
  end
end