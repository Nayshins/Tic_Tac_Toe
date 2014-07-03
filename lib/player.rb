class Player
  attr_accessor :team, :current_player

  def initialize(team) # 'X' or 'O'
    @team = team
    @current_player = nil
  end
end