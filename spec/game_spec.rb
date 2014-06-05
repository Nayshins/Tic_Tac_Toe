# require "spec_helper"

# describe "Game" do

#   before :all do
#     @game = Game.new
#     @game.select_team.stub { @human_player = Player.new('X')
#                              @computer = Computer.new('O') }
#   end

#   describe "#initialize" do
#     it "initializes with a human player" do
#       @game.human_player.should be_an_instance_of Player
#     end
#     it "initializes with a computer player" do
#       @game.computer.should be_an_instance_of Computer
#     end
#     it "initializes with a current player" do
#       @game.current_player.should eq(@game.human_player)
#     end
#     it "initializes with a new board" do
#       @game.board.should be_an_instance_of Board
#     end
#   end

#   describe "#switch_players" do
#     it "switches current_player and next_player" do
#       @game.switch_players
#       @game.human_player.should_not eq(@game.current_player)
#     end
#   end
# end