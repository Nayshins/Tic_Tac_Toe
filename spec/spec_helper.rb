$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'factory_girl'
require 'board'
require 'computer'
require 'player'
require 'game'
require 'setup'
require 'rules'
require 'console'

FactoryGirl.find_definitions # was not working without this
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end