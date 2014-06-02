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
  private

  def create_grid
    grid = []
    (1..9).each do |i|
      grid << Cell.new
    end
    grid
  end
end