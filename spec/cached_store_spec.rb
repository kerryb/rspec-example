require 'spec'
$: << File.dirname(__FILE__) + '/../lib'
require 'cached_store'

describe CachedStore do
  it do
    CachedStore.new.should respond_to(:get)
  end
  it do
    CachedStore.new.should respond_to(:set)
  end
end