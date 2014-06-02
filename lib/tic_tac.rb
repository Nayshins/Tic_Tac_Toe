class Game
  attr_accessor :board, :current_player, :other_player
  def initialize(players,board = Board.new)
    @players = players
    @board = board
    @current_player, @other_player = players.shuffle
  end

  def ask_for_move
    "#{current_player.name}: Enter the number of the square you want to play in"
  end

  def get_human_move
    
    human_move = $stdin.gets.chomp.to_i
    human_move -= 1
  end

  def switch_players
    @current_player, @other_player = @other_player, @current_player
  end

  def game_over_message
    return "#{current_player.name} won!" if board.game_over == :winner
    return "The game ended in a tie" if board.game_over == :draw
  end

  def play
    puts "#{current_player.name} has been selected to go first!"
    while true
      board.print_grid
      puts ""
      puts ask_for_move
      selection = get_human_move
      board.set_cell(selection, current_player.team)
      if board.game_over
        puts game_over_message
        board.print_grid
        return
      else
        switch_players
      end  
    end 
  end

end

class Cell
  attr_accessor :value
  
  def initialize(value = '')
    @value = value
  end
end

class Player

  attr_accessor :name, :team

  def initialize(player_args)
    @name = player_args.fetch(:name)
    @team = player_args.fetch(:team)
  end
end

class Board
  attr_accessor :grid

  def initialize
    @grid = create_grid
  end

  def get_cell(position)
    grid[position]
  end

  def set_cell(position, value)
    get_cell(position).value = value
  end

  def game_over
    return :winner if winner?
    return :draw if draw?
    false
  end

  def winner?
    winning_positions.each do |winning_position|
      if grid_values(winning_position).reduce(:+) == "XXX" ||
         grid_values(winning_position).reduce(:+) == "OOO"
         return true
      end
    end
    false
  end

  def draw?
    grid.each do |cell|
      return false if cell.value.empty?
    end
    true
  end

  def print_grid
    new_grid = formatted_grid
    puts 
    puts " #{new_grid[0]} | #{new_grid[1]} | #{new_grid[2]}"
    puts "---+---+---"
    puts " #{new_grid[3]} | #{new_grid[4]} | #{new_grid[5]}"
    puts "---+---+---"
    puts " #{new_grid[6]} | #{new_grid[7]} | #{new_grid[8]}"
    puts
  end

  private

  def formatted_grid
    formatting = grid_values(grid)
    formatting.map!.with_index do |cell, index|
      if cell == ""
        cell = index + 1
      else
        cell = cell  
      end
    end
    formatting      
  end

  def create_grid
    grid = []
    (1..9).each do |i|
      grid << Cell.new
    end
    grid
  end

  def grid_values(values_grid)
    values_grid.map { |cell| cell.value }
  end

  def winning_positions
    check_grid = grid.each_slice(3).to_a
    return check_grid + check_grid.transpose + diagonals
  end

  def diagonals
    [[get_cell(0),get_cell(4),get_cell(8)],
     [get_cell(6),get_cell(4),get_cell(2)]]
  end
end