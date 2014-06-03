require "spec_helper"
describe "Board" do
  before :all do
    @board = Board.new
  end
  describe "#initialize" do
    it "initializes with a grid variable" do
      @board.grid.should_not be_nil
    end
    describe "#grid" do
      it "is an array" do
        @board.grid.should be_an_instance_of Array
      end
      it "has a length of 9" do
        @board.grid.length.should eq(9)
      end
      it "all elements are a blank space" do
        @board.grid.each { |e| e.should eq(' ') }
      end
    end
  end

  describe "#locations" do
    it "returns the locations of all ' ' spaces" do
      @board.locations(' ').should eq((0..8).to_a)
    end
    it "returns the locations of 'X' " do
      @board.grid = ['X',' ',' ',' ','X','O','X',' ',' ']
      @board.locations('X').should eq([0,4,6])
    end
    it "returns the locations of 'O' " do
      @board.grid = ['X','O',' ',' ','X','O','X',' ','O']
      @board.locations('O').should eq([1,5,8])
    end
  end

  describe "#get_moves" do
    it "returns all the locations of ' ' " do
      @board.grid = ['X','O',' ',' ','X','O','X',' ','O']
      @board.get_moves.should eq([2,3,7])
    end
  end

  describe "#get_rows" do
    it "returns 2d array of row values" do
      @board.grid = ['X','X','X',' ',' ',' ',' ',' ',' ']
      @board.get_rows.should eq([['X','X','X'],
                                 [' ',' ',' '],
                                 [' ',' ',' ']])
    end
  end

  describe "#get_cols" do
    it "returns a 2d array of column values" do
      @board.grid = ['X','X','X',' ',' ',' ',' ',' ',' ']
      @board.get_cols.should eq([['X',' ',' '],
                                 ['X',' ',' '],
                                 ['X',' ',' ']])
    end
  end

  describe "#get_diagonals" do
    it "returns a 2d array of the diagonal values" do
      @board.grid = ['X',' ',' ',' ','X',' ',' ',' ','X']
      @board.get_diagonals.should eq([['X','X','X'],
                                      [' ','X',' ']])
    end
  end

  describe "#make_solutions" do
    it "returns a 2d array of all solutions" do
      @board.grid = ['X','X','X',' ',' ',' ',' ',' ',' ']
      @board.make_solutions.should eq([['X','X','X'],
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