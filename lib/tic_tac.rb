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
  
end