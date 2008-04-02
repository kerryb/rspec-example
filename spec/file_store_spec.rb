require 'spec'
$: << File.dirname(__FILE__) + '/../lib'
require 'file_store'

describe FileStore do
  it do
    FileStore.new.should respond_to(:get)
  end
  it do
    FileStore.new.should respond_to(:set)
  end
end