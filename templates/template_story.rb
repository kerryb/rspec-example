require 'rubygems'
require 'spec/story'
$: << '../lib'

steps_for :acceptance do
  
  Given "" do
  end
  
  When "" do
  end
  
  Then "" do
  end
end

with_steps_for :acceptance do
  run File.dirname(__FILE__) + '/acceptance.txt'
end