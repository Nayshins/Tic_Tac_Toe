class Rules
  
  attr_accessor :board, :winning_team

  def initialize(board)
    @board = board
  end

  def winner?
    board.make_solutions.each do |solution|
      next if solution[0] == ' '
      return @winning_team = solution[0] if solution.all? { |ele| solution[0] == ele }
    end
    false
  end

  def win_test(team)
    board.make_solutions.each do |solution|
      next if solution[0] == ' ' || solution[0] != team
      return true if solution.all? { |ele| team == ele }
    end
    false
  end

  def draw?
    return true if board.get_moves == []
    false
  end

  def game_over?
    return :winner if winner?
    return :draw if draw?
    false
  end
end  