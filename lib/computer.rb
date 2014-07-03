class Computer
  attr_accessor :team, :current_player
  INFINITY = 1.0/0.0
  def initialize(team)
    @team = team
    @current_player = nil
  end

  def negamax(rules,team,depth,alpha,beta)
    opponent = get_opponent(team)
    best_score = -1.0/0
    if rules.game_over?
      return board_score(rules, team) / depth
    else
      rules.board.get_moves.each do |move|
        rules.board.set_move(move,team)
        score = -negamax(rules, opponent, depth + 1,-beta,-alpha)
        rules.board.undo_move(move)
        if score > best_score
          best_score = score
        end
        if score > alpha
          alpha = score
        end
        if alpha >= beta
          break
        end
      end
      return best_score
    end
  end

  def make_move(rules, team)
    best_move = nil
    best_score = -INFINITY
    opponent = get_opponent(team)
    rules.board.get_moves.each do |move|
      rules.board.set_move(move,team)
      score = -negamax(rules, opponent, 1,-INFINITY, INFINITY)
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
    elsif rules.win_test(get_opponent(team))  
      return -1.0
    else
      return 0.0
    end  
  end
end