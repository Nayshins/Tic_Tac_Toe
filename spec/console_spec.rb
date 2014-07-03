require 'spec_helper'

describe "Console" do
  let(:board) { Board.new }
  let(:ui)    { Console.new(board) }

  describe "#print_welcome" do
    it "prints the welcome message" do
      expect(ui).to receive(:put_to_console)
      ui.print_welcome
    end
  end
  describe "#print_pick_team" do
    it "prints the welcome message" do
      expect(ui).to receive(:put_to_console)
      ui.print_pick_team
    end
  end
  describe "#print_instructions" do
    it "prints the game instructions" do
      expect(ui).to receive(:put_to_console)
      ui.print_instructions
    end
  end
  describe "#print_invalid_entry" do
    it "prints the invalid team entry message" do
      expect(ui).to receive(:put_to_console)
      ui.print_invalid_entry
    end
  end
  describe "#print_invalid_move" do
    it "prints the invalid move message" do
      expect(ui).to receive(:put_to_console)
      ui.print_invalid_move
    end
  end
  describe "#print_computer_move" do
    it "prints the computer is moveing message" do
      expect(ui).to receive(:put_to_console)
      ui.print_computer_move
    end
  end
  describe "#print_winner" do
    it "prints the winning team" do
      expect(ui).to receive(:put_to_console)
      ui.print_winner('X')
    end
  end
  describe "#declare_draw" do
    it "prints the draw message" do
      expect(ui).to receive(:put_to_console)
      ui.declare_draw
    end
  end
  describe "#get_move" do
    it "gets the players move" do
      expect(ui).to receive(:get_user_input)
      ui.get_move
    end
  end
  describe "#get_team" do
    it "gets the players team choice" do
      expect(ui).to receive(:get_user_input)
      ui.get_team
    end
  end
  describe "#print_board" do
    it "prints the current board" do
      expect(ui).to receive(:put_to_console)
      ui.put_to_console(ui.format_board)
    end
  end
  describe "#format_board" do
    it "formats the board into a tic tac toe" do
      expect(ui.format_board).to eq("   |   |   \n"\
                                    "---+---+---\n"\
                                    "   |   |   \n"\
                                    "---+---+---\n"\
                                    "   |   |   \n")
    end
  end
end
