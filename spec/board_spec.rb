require "spec_helper"

describe "Board" do
  before :each do
    @board = Board.new
  end
  context "#inialize" do
    it "creates an array of 9 empty cell objects" do
      @board.grid.should have(9).things
    end
  end
end