class Game
  attr_accessor :human_player, :computer,:rules, :next_player, :ui

  @@move_map = { '1' => 0, '2' => 1, '3' => 2,
                 '4' => 3, '5' => 4, '6' => 5,
                 '7' => 6, '8' => 7, '9' => 8 }

  def initialize(ui, rules, human_player, computer)
    @ui = ui
    @rules = rules
    @human_player = human_player
    @computer = computer
  end

  def game_loop
    while rules.game_over? == false  
      if human_player.current_player
        get_human_move
        switch_players
      else
        computer_move
        switch_players
      end
    end
    game_over
  end

  def get_human_move
    ui.print_board
    ui.print_instructions
    valid = false
    until valid 
      move = ui.get_move
      return valid = true if validate_move(move) 
    end
  end

  def validate_move(move)
    if rules.board.get_moves.include?(@@move_map[move])
      set_move(@@move_map[move], human_player.team)
    else
      ui.print_invalid_move
      false
    end  
  end

  def set_move(move, team)
    rules.board.set_move(move, team)
  end

  def computer_move
    ui.print_board
    ui.print_computer_move
    move = computer.make_move(rules,computer.team)
    set_move(move,computer.team)
  end

  def switch_players
    if human_player.current_player
      human_player.current_player = false
      computer.current_player = true
    else
      human_player.current_player = true
      computer.current_player = false
    end
  end

  def game_over
    if rules.game_over? == :winner
      ui.print_board
      ui.print_winner(rules.winning_team)
    else
      ui.print_board
      ui.declare_draw
    end  
  end
end
  
