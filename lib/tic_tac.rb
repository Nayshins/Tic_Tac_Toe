class Board
  attr_accessor :grid, :solutions
  
  def initialize
    @grid = [' '] * 9
  end

  def locations(piece) #returns the index of 'X', 'O', or ' '
    grid.each_index.select { |index| grid[index] == piece }
  end

  def get_moves
    return locations(' ')
  end

  def make_solutions
    get_rows + get_cols +  get_diagonals
  end

  def get_rows
    grid.each_slice(3).to_a  
  end

  def get_cols
    grid.each_slice(3).to_a.transpose # returns the transpose of rows = columns
  end

  def get_diagonals
    [[grid[0], grid[4], grid[8]], [grid[2], grid[4], grid[6]]]
  end

  def print_grid
    puts 
    puts " #{grid[0]} | #{grid[1]} | #{grid[2]}"
    puts "---+---+---"
    puts " #{grid[3]} | #{grid[4]} | #{grid[5]}"
    puts "---+---+---"
    puts " #{grid[6]} | #{grid[7]} | #{grid[8]}"
    puts
  end

  def winner?
    make_solutions.each do |solution|
      next if solution[0] == ' '
      return true if solution.all? { |ele| solution[0] == ele }
    end
    false
  end

  def draw?
    return true if get_moves == []
    false
  end

  def game_over?
    return :winner if winner? 
    return :draw if draw?
    false
  end
end

class Player
  attr_accessor :team

  def initialize(team) # 'X' or 'O'
    @team = team
  end
end

class Computer
  attr_accessor :team
  INFINITY = 1.0/0

  def initialize(team)
    @team = team
  end

  def negamax(board,depth)
    if board.game_over?
    end
  end

  def board_value(board)
    
  end
end

class Game
  attr_accessor :human_player, :computer, :current_player, :board, :next_player

  def initialize
    select_team
    @current_player = human_player
    @next_player = computer
    @board = Board.new
  end

  def select_team
    puts "Welcome to Tic Tac Toe"
    puts "please enter 1 to be X and 2 to be O"
    valid_entry = false
    until valid_entry
      entry = gets.chomp
      case entry
      when '1'
        @human_player = Player.new('X')
        @computer = Computer.new('O')
        valid_entry = true
      when '2'
        @human_player = Player.new('O')
        @computer = Computer.new('X')
        valid_entry = true  
      else
        puts "Invalid entry, Please enter 1 to be X and 2 to be O"  
      end 
    end
  end

  def game_loop
    while @board.game_over? == false  
      if current_player == human_player
        get_human_move
        switch_players
      else
        lazy_computer_move
        switch_players
      end
    end
    game_over
  end

  def get_human_move
    board.print_grid
    puts "select a square by entering 1-9"
    valid = false
    until valid 
      move = gets.chomp
      return valid = true if validate_move(move) 
    end
  end

  def validate_move(move)
    if move =~ /\d/ && board.get_moves.include?(move.to_i - 1)
      board.grid[move.to_i - 1] = human_player.team
    else
      puts "invalid move enter a different number"
      false
    end  
  end

  def lazy_computer_move
    board.print_grid
    puts "Computer making its move..."
    possible_moves = board.get_moves
    board.grid[possible_moves.first] = computer.team
  end

  def switch_players
    @current_player, @next_player = @next_player, @current_player
  end

  def game_over
    if board.game_over? == :winner
      board.print_grid
      puts "#{@next_player.team} is the winner!"
    else
      board.print_grid
      puts "Draw!"
    end  
  end
end

game = Game.new
game.game_loop
