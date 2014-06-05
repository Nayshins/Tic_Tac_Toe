require "spec_helper"

describe "Game" do

  before :all do
    @game = Game.new
  end

  describe "#initialize" do
    it "initializes with a new board" do
      @game.board.should be_an_instance_of Board
    end
  end

  describe "#switch_players" do
    it "switches current_player and next_player" do
      @game.human_player = Player.new('X')
      @game.current_player = @game.human_player
      @game.switch_players
      @game.human_player.should_not eq(@game.current_player)
    end
  end

  describe "#select_team" do
    it "sets the human player as 'X' when it recieves a 1" do
      @game.stub(:select_team).and_return('1')
      @game.human_player.team.should eq('X')
    end
    it "set the human player as 'O' when it recieves a 2" do
      @game.stub(:select_team).and_return('1')
      @game.human_player.team.should eq('X')
    end
  end
end