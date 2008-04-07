require 'spec'

# Use provided matchers.
describe 'An empty string' do
  it 'should be empty' do
    ''.should be_empty
  end
end

# Specifying required accuracy for floating point
describe 'two floating point numbers' do
  it 'should be about the same' do
    (10.0/3).should be_close(3.333, 0.01)
  end
end

# One assertion per spec, and use of stub_everything
describe 'a method that does lots of things in a row' do
  def contrived_method str
    str.upcase!
    str.strip!
    str.reverse!
  end
  
  before do
    @str = stub_everything 'string'
  end
  
  it 'should convert to uppercase' do
    @str.should_receive :upcase!
    contrived_method @str
  end

  it 'should strip leading and trailing space' do
    @str.should_receive :strip!
    contrived_method @str
  end

  it 'should reverse the string' do
    @str.should_receive :reverse!
    contrived_method @str
  end
end

# Include class name in description, otherwise it gets lost in report when
# you're running multiple specs at once
describe Array, 'adding a value' do
  it 'should work' do
    arr = [1, 2]
    arr << 3
    arr.should include(3)
  end
end

# Pending spec
describe 'some behaviour' do
  it 'should be implemented later'
end

# Use modules for methods shared between specs, otherwise they are in global
# namespace and can overwrite each other. Methods used in only one spec can
# go inside the describe block.
module GoodSpec
  def setup
    @foo = 1
  end
end

describe 'doing something' do
  include GoodSpec
  
  before do
    setup
  end
  
  it 'should do something' do
    @foo.should == 1
  end
end

describe 'doing something else' do
  include GoodSpec
  
  before do
    setup
  end

  it 'should do something' do
    @foo.should == 1
  end
end