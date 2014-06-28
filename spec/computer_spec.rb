require "spec_helper"

#TODO: Use a factory pattern instead of mutating instace variable state.
INFINITY = 1.0/0.0
describe "Computer" do
    
  let(:computer) { Computer.new('X') }
  let(:board)    { Board.new }
  let(:rules)    { Rules.new(board) }

  describe "#initialize" do
    it "initializes with a team" do
      expect(computer.team).to eq('X')
    end
  end

  describe "#board_score" do
    it "returns 1 if X wins" do
      rules.board = build(:board, :horizontal_win)
      expect(computer.board_score(rules, 'X')).to eq(1)
    end

    it "returns -1 if O wins" do
      rules.board = build(:board, :o_win)
      expect(computer.board_score(rules, 'X')).to eq(-1)
    end
    it "returns 0 if game is tied" do
      rules.board = build(:board, :draw)
      expect(computer.board_score(rules, 'O')).to eq(0)
    end
  end

  describe "#negamax" do
    it "returns a score for board and marker" do
      rules.board = build(:board, :grid =>['O', 'O', 'X', 
                                     'X', 'O', 'O', 
                                     'O', 'X', 'X'])
      expect(computer.negamax(rules, 'O',1,INFINITY,-INFINITY)).to eq(0)
    end
    it "returns a 1 for a winning move" do
      rules.board = build(:board, :grid => ['O', 'O', 'X', 
                                      'X', 'X', 'O', 
                                      ' ', 'X', 'O'])
      expect(computer.negamax(rules, 'X',0,INFINITY,-INFINITY)).to eq(1)               
    end
    it "returns 0 for a tie game move" do
      rules.board = build(:board, :grid =>['O', 'X', 'X', 
                                     'X', 'O', 'O', 
                                     ' ', 'X', 'X'])
      expect(computer.negamax(rules, 'O',0,INFINITY,-INFINITY)).to eq(0)               
    end
  end

  describe "#make_move" do
    it "returns cell that makes 3 in a row" do
      rules.board = build(:board, :grid =>['O', 'O', ' ', 
                                           'X', 'X', ' ', 
                                           ' ', 'O', 'X'])
      expect(computer.make_move(rules, 'O')).to eq(2)                
    end

    it "blocks a 3 in a row" do
      rules.board = build(:board, :grid =>[' ', ' ', 'O', 
                                           ' ', 'X', ' ', 
                                           ' ', 'X', ' '])
      expect(computer.make_move(rules, 'O')).to eq(1) 
    end
    it "completes the game instead of blocking" do
      rules.board = build(:board, :grid =>['O', ' ', 'O', 
                                           ' ', ' ', ' ', 
                                           'X', 'X', ' '])
      expect(computer.make_move(rules, 'O')).to eq(1) 
    end
    it "completes three in a row ahead of a tie" do
      rules.board = build(:board, :grid =>['O', 'X', ' ', 
                                           'X', 'O', 'X', 
                                           'X', 'X', ' '])
      expect(computer.make_move(rules, 'O')).to eq(8) 
    end
  end
end