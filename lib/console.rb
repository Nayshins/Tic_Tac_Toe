#TODO: Move all methods that pertain to printing to the console here.
class Console
  attr_accessor :board

  def initialize(board)
    @board = board
  end

  def print_welcome
    put_to_console("Welcome to Unbeatable Tic Tac Toe...")
  end

  def print_pick_team
    put_to_console("Please enter 1 to be X or 2 to be O")
  end

  def print_instructions
    put_to_console("select a square by entering 1-9\n")
  end

  def print_invalid_entry
    put_to_console("Invalid entry, Please enter 1 to be X and 2 to be O")
  end

  def print_invalid_move
    put_to_console("invalid move enter a different number")
  end

  def print_computer_move
    put_to_console("The computer is making its move...\n")
  end

  def print_winner(team)
    put_to_console("#{team} is the winner!")
  end

  def declare_draw
    put_to_console("Draw!")
  end

  def get_move
    get_user_input
  end

  def get_team
    get_user_input
  end

  def get_user_input
    gets.chomp
  end

  def print_board
    put_to_console(format_board)
  end

  def format_board
    board.grid.each_slice(3).
                     map { |a,b,c| " #{a} | #{b} | #{c} \n" }.
                     join("---+---+---\n")
  end

  def put_to_console(text)
    puts text
  end 
end