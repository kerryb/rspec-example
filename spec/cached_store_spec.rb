require 'spec'
$: << File.dirname(__FILE__) << File.dirname(__FILE__) + '/../lib'
require 'cached_store'
require 'store_spec'

describe CachedStore do
  before do
    @store = CachedStore.new
  end
  
  it_should_behave_like 'a store'
  
  it 'should be initially empty' do
    @store.should be_empty
  end

  describe "adding a new item" do
    it "should increase the number of items" do
      lambda{@store.set 'foo', 'bar'}.should change(@store, :size).by 1
    end
  end
  
  describe 'after adding an item' do
    before do
      @store.set 'foo', 'bar'
    end
    
    it 'should return the stored value when requested' do
      @store.get('foo').should == 'bar'
    end
    
    it 'should not be empty' do
      @store.should_not be_empty
    end
  end
end