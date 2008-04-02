require 'spec'
$: << File.dirname(__FILE__) << File.dirname(__FILE__) + '/../lib'
require 'cached_store'
require 'store_spec'

describe CachedStore do
  before do
    @store = CachedStore.new
  end
  
  it_should_behave_like 'a store'
end