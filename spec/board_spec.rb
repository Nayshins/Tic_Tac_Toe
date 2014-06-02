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
  context "#get_cell" do
    it "returns the a cell at a position on the board" do
      @board.get_cell(1).should be_an_instance_of Cell
    end
  end
  context "#set_cell" do
    it "updates the value of the cell object at position 1 - 9" do
      @board.set_cell(1,"X")
      @board.get_cell(1).value.should eq("X")
    end
  end
end