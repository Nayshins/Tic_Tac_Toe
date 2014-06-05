require 'rspec'
require_relative '../lib/board'
require_relative '../lib/computer'
require_relative '../lib/player'
require_relative '../lib/game'

RSpec.configure do |config|
  # Use color in STDOUT
  config.color_enabled = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate
end
