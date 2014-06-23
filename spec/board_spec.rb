require "spec_helper"
describe "Board" do
  before :each do
    @board = Board.new
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

  describe "#winner?" do

    it "returns true when 3 in a row are the same" do
      @board.grid = ['X','X','X',' ',' ',' ',' ',' ',' ']
      @board.winner?.should be_truthy
    end

    it "returns true when 3 in a col are the same" do
      @board.grid = ['X',' ',' ','X',' ',' ','X',' ',' ']
      @board.winner?.should be_truthy
    end

    it "returns true when 3 in a diagonal are the same" do
      @board.grid = ['X',' ',' ',' ','X',' ',' ',' ','X']
      @board.winner?.should be_truthy
    end

    it "returns false when there is no winner" do
      @board.grid = ['X','O','X',' ',' ',' ',' ',' ',' ']
      @board.winner?.should be_falsey
    end
  end

  describe "#win_test" do
    it "returns true when there is a winner of a certain team" do
      @board.grid = ['X','X','X',' ',' ',' ',' ',' ',' ']
      @board.win_test('X').should be_truthy
    end
    it "returns false when there is not a winner" do
      @board.grid = ['X','O','X',' ',' ',' ',' ',' ',' ']
      @board.win_test('X').should be_falsey
    end
  end

  describe "#draw?" do
    it "returns true when there are no moves left" do
      @board.grid = ['X','O','X','O','X','O','O','X','O']
      @board.draw?.should be_truthy
    end

    it "returns false if there are still open spaces" do
      @board.grid = ['X','O','X',' ',' ',' ',' ',' ',' ']
      @board.draw?.should be_falsey
    end
  end

  describe "#game_over?" do

    it "returns true if there is a winner" do
      @board.grid = ['X','X','X',' ',' ',' ',' ',' ',' ']
      @board.game_over?.should be_truthy
    end

    it "returns true if there is a draw" do
      @board.grid = ['X','O','X','O','X','O','O','X','O']
      @board.game_over?.should be_truthy
    end

    it "returns false if there is no winer or draw" do
      @board.grid = ['X','O','X',' ',' ',' ',' ',' ',' ']
      @board.draw?.should be_falsey
    end
  end
end