require "spec_helper"
describe "Board" do
  
  describe "#locations" do
    it "returns the locations of all ' ' spaces" do
      board = build(:board, :empty)
      board.locations(' ').should eq((0..8).to_a)
    end
    it "returns the locations of 'X' " do
      board = build(:board, :grid => ['X',' ',' ',' ','X','O','X',' ',' '])
      board.locations('X').should eq([0,4,6])
    end
    it "returns the locations of 'O' " do
      board = build(:board, :grid => ['X','O',' ',' ','X','O','X',' ','O']) 
      board.locations('O').should eq([1,5,8])
    end
  end

  describe "#get_moves" do
    it "returns all the locations of ' ' " do
      board = build(:board, :grid => ['X','O',' ',' ','X','O','X',' ','O'])
      board.get_moves.should eq([2,3,7])
    end
  end

  describe "#get_rows" do
    it "returns 2d array of row values" do
      board = build(:board, :horizontal_win)
      board.get_rows.should eq([['X','X','X'],
                                 [' ',' ',' '],
                                 [' ',' ',' ']])
    end
  end

  describe "#get_cols" do
    it "returns a 2d array of column values" do
      board = build(:board, :vertical_win)
      expect(board.get_cols).to eq([['X','X','X'],
                                    [' ',' ',' '],
                                    [' ',' ',' ']])
    end
  end

  describe "#get_diagonals" do
    it "returns a 2d array of the diagonal values" do
      board = build(:board, :diagonal_win)
      board.get_diagonals.should eq([['X','X','X'],
                                      [' ','X',' ']])
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

  describe "#winner?" do

    it "returns true when 3 in a row are the same" do
      board = build(:board, :horizontal_win)
      expect(board.winner?).to be_truthy
    end

    it "returns true when 3 in a col are the same" do
      board = build(:board, :vertical_win)
      expect(board.winner?).to be_truthy
    end

    it "returns true when 3 in a diagonal are the same" do
      board = build(:board, :diagonal_win)
      expect(board.winner?).to be_truthy
    end

    it "returns false when there is no winner" do
      board = build(:board, :draw)
      expect(board.winner?).to be_falsey
    end
  end

  describe "#win_test" do
    it "returns true when there is a winner of a certain team" do
      board = build(:board, :horizontal_win)
      expect(board.win_test('X')).to be_truthy
    end
    it "returns false when there is not a winner" do
      board = build(:board, :empty)
      expect(board.win_test('X')).to be_falsey
    end
  end

  describe "#draw?" do
    it "returns true when there are no moves left" do
      board = build(:board, :draw)
      expect(board.draw?).to be_truthy
    end

    it "returns false if there are still open spaces" do
      board = build(:board, :empty)
      expect(board.draw?).to be_falsey
    end
  end

  describe "#game_over?" do

    it "returns true if there is a winner" do
      board = build(:board, :horizontal_win)
      expect(board.game_over?).to be_truthy
    end

    it "returns true if there is a draw" do
      board = build(:board, :draw)
      expect(board.game_over?).to be_truthy
    end

    it "returns false if there is no winer or draw" do
      board = build(:board, :empty)
      expect(board.draw?).to be_falsey
    end
  end
end