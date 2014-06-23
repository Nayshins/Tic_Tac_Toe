class Computer
  attr_accessor :team

  def initialize(team)
    @team = team
  end

  def minimax(board,team,depth)
    opponent = get_opponent(team)
    best_score = -1.0/0
    if board.game_over?
      return board_score(board, team) / depth
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

  def board_score(board, team)
    if board.win_test(team)
      return 1.0
    elsif board.win_test(get_opponent(team))  #ugh hate this 
      return -1.0
    else
      return 0.0
    end  
  end
end