require 'spec'
$: << File.dirname(__FILE__) << File.dirname(__FILE__) + '/../lib'
require 'file_store'
require 'store_spec'

describe FileStore do
  before do
    @store = FileStore.new
  end
  
  it_should_behave_like 'a store'
end