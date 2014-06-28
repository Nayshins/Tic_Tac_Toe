class Computer
  attr_accessor :team

  def initialize(team)
    @team = team
  end

  def minimax(rules,team,depth)
    opponent = get_opponent(team)
    best_score = -1.0/0
    if rules.game_over?
      return board_score(rules, team) / depth
    else
      rules.board.get_moves.each do |move|
        rules.board.set_move(move,team)
        score = -minimax(rules, opponent, depth + 1)
        rules.board.undo_move(move)
        if score > best_score
          best_score = score
        end
      end
      return best_score
    end
  end

  def make_move(rules, team)
    best_move = nil
    best_score = -1.0/0
    opponent = get_opponent(team)
    rules.board.get_moves.each do |move|
      rules.board.set_move(move,team)
      score = -minimax(rules, opponent, 1)
      rules.board.undo_move(move)
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

  def board_score(rules, team)
    if rules.win_test(team)
      return 1.0
    elsif rules.win_test(get_opponent(team))  #ugh hate this 
      return -1.0
    else
      return 0.0
    end  
  end
end