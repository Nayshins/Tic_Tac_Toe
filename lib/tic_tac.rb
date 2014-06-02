class Game
  attr_accessor :board, :current_player, :other_player
  def intialize(players,board = Board.new)
    @players = players
    @board = board
    @current_player, @other_player = players.shuffle
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
  
  private

  def create_grid
    grid = []
    (1..9).each do |i|
      grid << Cell.new
    end
    grid
  end

  def grid_values(winning_position)
    winning_position.map { |cell| cell.value }
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