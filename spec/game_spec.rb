require "spec_helper"

describe "Game" do

  before :all do
    @game = Game.new
  end

  describe "#initialize" do
    it "initializes with a human player" do
      @game.player.should be_an_instance_of Player
    end
    it "initializes with a computer player" do
      @game.computer.should be_an_instance_of Computer
    end
    it "initializes with a current player" do
      @game.current_player.should eq(@game.player)
    end
    it "initializes with a new board" do
      @game.board.should be_an_instance_of Board
    end
  end
end