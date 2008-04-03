require 'spec'

describe 'An empty string' do
  it 'should be empty' do
    ''.empty?.should == true
  end
end

describe 'two floating point numbers' do
  it 'should be about the same' do
    ((10.0/3 - 3.333).abs < 0.01).should be_true
  end
end

describe 'a method that does lots of things in a row' do
  def contrived_method str
    str.upcase!
    str.strip!
    str.reverse!
  end
  
  it 'should do all the things' do
    str = mock 'string'
    str.should_receive :upcase!
    str.should_receive :strip!
    str.should_receive :reverse!
    contrived_method str
  end
end

describe 'adding a value' do
  it 'should work' do
    arr = [1, 2]
    arr << 3
    arr.should include(3)
  end
end

describe 'some behaviour' do
  it 'should be implemented later' do
    # TODO
  end
end

def setup
  @foo = 1
end

describe 'doing something' do
  before do
    setup
  end
  
  it 'should do something' do
    @foo.should == 1
  end
end

describe 'doing something else' do
  before do
    setup
  end

  it 'should do something' do
    @foo.should == 1
  end
end