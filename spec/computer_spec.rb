require "spec_helper"

#TODO: Use a factory pattern instead of mutating instace variable state.

describe "Computer" do
    
  let(:computer) { Computer.new('X') }

  describe "#initialize" do
    it "initializes with a team" do
      computer.team.should eq('X')
    end
  end

  describe "#board_score" do
    it "returns 1 if X wins" do
      board = build(:board, :horizontal_win)
      computer.board_score(board, 'X').should eq(1)
    end

    it "returns -1 if O wins" do
      board = build(:board, :o_win)
      computer.board_score(board, 'X').should eq(-1)
    end
    it "returns 0 if game is tied" do
      board = build(:board, :draw)
      computer.board_score(board, 'O').should eq(0)
    end
  end

  describe "#minimax" do
    it "returns a score for board and marker" do
      board = build(:board, :grid =>['O', 'O', 'X', 
                                     'X', 'O', 'O', 
                                     'O', 'X', 'X'])
      computer.minimax(board, 'O',1).should eq(0)
    end
    it "returns a 1 for a winning move" do
      board = build(:board, :grid => ['O', 'O', 'X', 
                                      'X', 'X', 'O', 
                                      ' ', 'X', 'O'])
      computer.minimax(board, 'X',0).should eq(1)               
    end
    it "returns 0 for a tie game move" do
      board = build(:board, :grid =>['O', 'X', 'X', 
                                     'X', 'O', 'O', 
                                     ' ', 'X', 'X'])
      computer.minimax(board, 'O',0).should eq(0)               
    end
  end

  describe "#make_move" do
    it "returns cell that makes 3 in a row" do
      board = build(:board, :grid =>['O', 'O', ' ', 
                                     'X', 'X', ' ', 
                                     ' ', 'O', 'X'])
      computer.make_move(board, 'O').should eq(2)                
    end

    it "blocks a 3 in a row" do
      board = build(:board, :grid =>[' ', ' ', 'O', 
                                     ' ', 'X', ' ', 
                                     ' ', 'X', ' '])
      computer.make_move(board, 'O').should eq(1) 
    end
    it "completes the game instead of blocking" do
      board = build(:board, :grid =>['O', ' ', 'O', 
                                     ' ', ' ', ' ', 
                                     'X', 'X', ' '])
      computer.make_move(board, 'O').should eq(1) 
    end
    it "completes three in a row ahead of a tie" do
      board = build(:board, :grid =>['O', 'X', ' ', 
                                     'X', 'O', 'X', 
                                     'X', 'X', ' '])
      computer.make_move(board, 'O').should eq(8) 
    end
  end
end