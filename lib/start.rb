require_relative "../lib/tic_tac.rb"

if ARGV[0] == nil
  puts "To start playing, please enter your name after ruby start.rb YOUR_NAME_HERE"
end

human    = Player.new(name: ARGV[0], team: "X")
computer = Player.new(name: "computer", team: "O")
players  = [human, computer]
game = Game.new(players)

game.play
