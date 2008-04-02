require 'spec'
$: << File.dirname(__FILE__) + '/../lib'

shared_examples_for 'a store' do
  it do
    @store.should respond_to(:get)
  end
  
  it do
    @store.should respond_to(:set)
  end
end