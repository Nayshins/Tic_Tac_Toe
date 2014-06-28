require "spec_helper"
describe "Board" do
  
  describe "#locations" do
    it "returns the locations of all ' ' spaces" do
      board = build(:board, :empty)
      expect(board.locations(' ')).to eq((0..8).to_a)
    end
    it "returns the locations of 'X' " do
      board = build(:board, :grid => ['X',' ',' ',' ','X','O','X',' ',' '])
      expect(board.locations('X')).to eq([0,4,6])
    end
    it "returns the locations of 'O' " do
      board = build(:board, :grid => ['X','O',' ',' ','X','O','X',' ','O']) 
      expect(board.locations('O')).to eq([1,5,8])
    end
  end

  describe "#get_moves" do
    it "returns all the locations of ' ' " do
      board = build(:board, :grid => ['X','O',' ',' ','X','O','X',' ','O'])
      expect(board.get_moves).to eq([2,3,7])
    end
  end

  describe "#make_solutions" do
    it "returns a 2d array of all solutions" do
      board = build(:board, :horizontal_win)
      expect(board.make_solutions).to eq( [['X','X','X'],
                                           [' ',' ',' '],
                                           [' ',' ',' '],
                                           ['X',' ',' '],
                                           ['X',' ',' '],
                                           ['X',' ',' '],
                                           ['X',' ',' '],
                                           ['X',' ',' ']])
    end
  end
end