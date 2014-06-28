# TODO: Move all methods that pertain to the rules to this class
class Rules
  
  attr_accessor :board

  def initialize(board)
    @board = board
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