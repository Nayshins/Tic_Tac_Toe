require "spec_helper"

describe "Board" do
  let(:board) { Board.new } 
  context "#inialize" do
    it "creates an array" do
      board.grid.should be_an_instance_of Array
    end
    it "creates an array of size 9" do
      board.grid.size.should eq(9)
    end
    it "contains cell objects" do
      board.grid.first.should be_an_instance_of Cell
    end
  end
  context "#get_cell" do
    it "returns the a cell at a position on the board" do
      board.get_cell(1).should be_an_instance_of Cell
    end
  end
  context "#set_cell" do
    it "updates the value of the cell object at position 1 - 9" do
      board.set_cell(1,"X")
      board.get_cell(1).value.should eq("X")
    end
  end
  context "#game_over" do
    it "returns the winner when #winner? is true" do
      board.stub(:winner?) { true }
     board.game_over.should eq(:winner)  
    end
    it "returns draw when #draw? is true and #winner is false" do
      board.stub(:draw?)   { true }
      board.stub(:winner?) { false }
      board.game_over.should eq(:draw)
    end
    it "returns false when #winner and #draw are false" do
      board.stub(:winner?) { false }
      board.stub(:draw?)   { false }
      board.game_over.should eq(false)
    end  
  end
end