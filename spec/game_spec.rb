require "spec_helper"

describe "Game" do
  before :all do
    @game = Game.new
  end
  describe "#initialize" do
    it "initializes with a board variable" do
      @game.board.should_not be_nil
    end
    it "initializes with a player variable 'X' " do
      @game.player.should eq('X')
    end
    describe "#board" do
      it "is an array" do
        @game.board.should be_an_instance_of Array
      end
      it "has a length of 9" do
        @game.board.length.should eq(9)
      end
      it "all elements are a blank space" do
        @game.board.each { |e| e.should eq(' ') }
      end
    end
  end

  describe "#locations" do
    it "returns the locations of all ' ' spaces" do
      @game.locations(' ').should eq((0..8).to_a)
    end
  end
end