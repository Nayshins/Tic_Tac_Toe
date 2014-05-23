require "spec_helper"

describe "Board" do
  before :each do
    @board = Board.new
  end
  context "#inialize" do
    it "creates an array" do
      @board.grid.should be_an_instance_of Array
    end
    it "creates an array of size 9" do
      @board.grid.size.should eq(9)
    end
    it "contains cell objects" do
      @board.grid.first.should be_an_instance_of Cell
    end
  end
end