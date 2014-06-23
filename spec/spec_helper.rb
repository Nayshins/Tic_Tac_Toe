require "factory_girl"
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'board'
require 'computer'
require 'player'
require 'game'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end