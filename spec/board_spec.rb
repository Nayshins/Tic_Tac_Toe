require "spec_helper"

describe "Board" do
  before :all do
    @board = Board.new
  end
  TestCell = Struct.new(:value)
  let(:x_cell) { TestCell.new("X") }
  let(:o_cell) { TestCell.new("O") }
  let(:empty)  { TestCell.new("") }
  describe "#inialize" do

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
  describe "#get_cell" do

    it "returns the a cell at a position on the board" do
      @board.get_cell(1).should be_an_instance_of Cell
    end
  end

  describe "#set_cell" do

    it "updates the value of the cell object at position 1 - 9" do
      @board.set_cell(1,"X")
      @board.get_cell(1).value.should eq("X")
    end
  end
  
  describe "#game_over" do

    it "returns the winner when #winner? is true" do
      @board.stub(:winner?) { true }
     @board.game_over.should eq(:winner)  
    end

    it "returns draw when #draw? is true and #winner is false" do
      @board.stub(:draw?)   { true }
      @board.stub(:winner?) { false }
      @board.game_over.should eq(:draw)
    end

    it "returns false when #winner and #draw are false" do
      @board.stub(:winner?) { false }
      @board.stub(:draw?)   { false }
      @board.game_over.should eq(false)
    end

    it "returns :winner when row has objects with all the same value" do
      grid = [x_cell, x_cell, x_cell,
              o_cell, empty, o_cell,
              o_cell, x_cell, empty]
      @board.grid = grid
      @board.game_over.should eq(:winner)
    end

    it "returns :winner when a column has objects of all the same value" do
      grid = [o_cell, x_cell, x_cell,
              o_cell, empty, o_cell,
              o_cell, x_cell, x_cell]
      @board.grid = grid
      @board.game_over.should eq(:winner)
    end

    it "returns :winner when a diagonal has objects of all the same value" do
      grid = [x_cell, o_cell, x_cell,
              o_cell, x_cell, o_cell,
              o_cell, x_cell, x_cell]
      @board.grid = grid
      @board.game_over.should eq(:winner)
    end

    it "returns a draw when all spaces are filled" do
      grid = [x_cell, o_cell, x_cell,
              o_cell, x_cell, o_cell,
              o_cell, x_cell, o_cell]
      @board.grid = grid
      @board.game_over.should eq(:draw)
    end

    it "returns false when there is no winner or draw" do
      grid = [x_cell, empty, empty,
              o_cell, empty, empty,
              o_cell, empty, empty]
      @board.grid = grid
      @board.game_over.should eq(false)
    end  
  end
end