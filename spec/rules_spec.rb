require 'spec_helper'


describe "Rules" do
  
  let(:board) { Board.new }
  let(:rules) { Rules.new(board) }
    
    describe "#winner?" do

    it "returns true when 3 in a row are the same" do
      rules.board = build(:board, :horizontal_win)
      expect(rules.winner?).to be_truthy
    end

    it "returns true when 3 in a col are the same" do
      rules.board = build(:board, :vertical_win)
      expect(rules.winner?).to be_truthy
    end

    it "returns true when 3 in a diagonal are the same" do
      rules.board = build(:board, :diagonal_win)
      expect(rules.winner?).to be_truthy
    end

    it "returns false when there is no winner" do
      rules.board = build(:board, :draw)
      expect(rules.winner?).to be_falsey
    end
  end

  describe "#win_test" do
    it "returns true when there is a winner of a certain team" do
      rules.board = build(:board, :horizontal_win)
      expect(rules.win_test('X')).to be_truthy
    end
    it "returns false when there is not a winner" do
      rules.board = build(:board, :empty)
      expect(rules.win_test('X')).to be_falsey
    end
  end

  describe "#draw?" do
    it "returns true when there are no moves left" do
      rules.board = build(:board, :draw)
      expect(rules.draw?).to be_truthy
    end

    it "returns false if there are still open spaces" do
      rules.board = build(:board, :empty)
      expect(rules.draw?).to be_falsey
    end
  end

  describe "#game_over?" do

    it "returns true if there is a winner" do
      rules.board = build(:board, :horizontal_win)
      expect(rules.game_over?).to be_truthy
    end

    it "returns true if there is a draw" do
      rules.board = build(:board, :draw)
      expect(rules.game_over?).to be_truthy
    end

    it "returns false if there is no winer or draw" do
      rules.board = build(:board, :empty)
      expect(rules.draw?).to be_falsey
    end
  end
end