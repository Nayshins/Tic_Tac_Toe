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

  def set_move(move,team)
    grid[move] = team
  end

  def undo_move(move)
    grid[move] = ' '
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

  def win_test(team)
    make_solutions.each do |solution|
      next if solution[0] == ' ' || solution[0] != team
      return true if solution.all? { |ele| team == ele }
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

  def initialize(team)
    @team = team
  end

  def minimax(board,team,depth)
    opponent = get_opponent(team)
    best_score = -1.0/0
    if board.game_over?
      return board_utility(board, team) / depth
    else
      board.get_moves.each do |move|
        board.set_move(move,team)
        score = -minimax(board, opponent, depth + 1)
        board.undo_move(move)
        if score > best_score
          best_score = score
        end
      end
      return best_score
    end
  end

  def make_move(board, team)
    best_move = nil
    best_score = -1.0/0
    opponent = get_opponent(team)
    board.get_moves.each do |move|
      board.set_move(move,team)
      score = -minimax(board, opponent, 1)
      board.undo_move(move)
      if score > best_score
        best_score = score
        best_move = move
      end
    end
    return best_move
  end

  def get_opponent(team)
    team == 'X' ? 'O' : 'X'
  end

  def board_utility(board, team)
    if board.win_test(team)
      return 1.0
    elsif board.win_test(team == 'X' ? 'O' : 'X')  #ugh hate this 
      return -1.0
    else
      return 0.0
    end  
  end
end

class Game
  attr_accessor :human_player, :computer, :current_player, :board, :next_player

  def initialize
    select_team
    @current_player = human_player
    @next_player = computer
    @board = Board.new
    game_loop
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
    while board.game_over? == false  
      if current_player == human_player
        get_human_move
        switch_players
      else
        computer_move
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

  def computer_move
    board.print_grid
    puts "Computer making its move..."
    move = computer.make_move(board,computer.team)
    board.set_move(move,computer.team)
  end

  def switch_players
    @current_player, @next_player = @next_player, @current_player
  end

  def game_over
    if board.game_over? == :winner
      board.print_grid
      puts "#{next_player.team} is the winner!"
    else
      board.print_grid
      puts "Draw!"
    end  
  end
end

game = Game.new


