require "spec_helper"

describe "Computer" do
  
  before :all do
    @computer = Computer.new('X')
    @board = Board.new
  end

  describe "#initialize" do
    it "initializes with a team" do
      @computer.team.should eq('X')
    end
  end

  describe "#board_utility" do
    it "returns 1 if X wins" do
      @board.grid = ['X', 'X', 'X', 
                     ' ', ' ', ' ', 
                     ' ', ' ', ' ']
      @computer.board_utility(@board, 'X').should eq(1)
    end

    it "returns -1 if O wins" do
      @board.grid = ['O', 'O', 'O', 
                     ' ', ' ', ' ', 
                     ' ', ' ', ' ']
      @computer.board_utility(@board, 'X').should eq(-1)
    end
    it "returns 0 if game is tied" do
      @board.grid = ['O', 'O', 'X', 
                     'X', 'O', 'O', 
                     'O', 'X', 'X']
      @computer.board_utility(@board, 'O').should eq(0)
    end
  end

  describe "#minimax" do
    it "returns a score for board and marker" do
      @board.grid = ['O', 'O', 'X', 
                     'X', 'O', 'O', 
                     'O', 'X', 'X']
      @computer.minimax(@board, 'O',1).should eq(0)
    end
    it "returns a 1 for a winning move" do
      @board.grid = ['O', 'O', 'X', 
                     'X', 'X', 'O', 
                     ' ', 'X', 'O']
      @computer.minimax(@board, 'X',0).should eq(1)               
    end
    it "returns 0 for a tie game move" do
      @board.grid = ['O', 'X', 'X', 
                     'X', 'O', 'O', 
                     ' ', 'X', 'X']
      @computer.minimax(@board, 'O',0).should eq(0)               
    end
  end

  describe "#make_move" do
    it "returns cell that makes 3 in a row" do
      @board.grid = ['O', 'O', ' ', 
                     'X', 'X', ' ', 
                     ' ', '8', 'X']
      @computer.make_move(@board, 'O').should eq(2)                
    end

    it "blocks a 3 in a row" do
      @board.grid = [' ', ' ', 'O', 
                     ' ', 'X', ' ', 
                     ' ', 'X', ' ']
      @computer.make_move(@board, 'O').should eq(1) 
    end
    it "completes the game instead of blocking" do
      @board.grid = ['O', ' ', 'O', 
                     ' ', ' ', ' ', 
                     'X', 'X', ' ']
      @computer.make_move(@board, 'O').should eq(1) 
    end
    it "completes three in a row ahead of a tie" do
      @board.grid = ['O', 'X', ' ', 
                     'X', 'O', 'X', 
                     'X', 'X', ' ']
      @computer.make_move(@board, 'O').should eq(8) 
    end
  end
end