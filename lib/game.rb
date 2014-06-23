class Game

  # game loop
  # 
  attr_accessor :human_player, :computer, :current_player, :board, :next_player

  @@move_map = {'1' => 0, '2' => 1, '3' => 2,
                '4' => 3, '5' => 4, '6' => 5,
                '7' => 6, '8' => 7, '9' => 8}

  def initialize
    @board = Board.new
  end

  def start_game
    puts "Welcome to Unbeatable Tic Tac Toe..."
    select_team
    first?
    game_loop
  end

  def select_team
    team = { '1' => 'X', '2' => 'O'}
    puts "Please enter 1 to be X or 2 to be O"
    valid_entry = false
    until valid_entry
      entry = gets.chomp
      if team[entry] == 'X'
        @human_player = Player.new('X')
        @computer = Computer.new('O')
        valid_entry = true
      elsif team[entry] == 'O'
        @human_player = Player.new('O')
        @computer = Computer.new('X')
        valid_entry = true  
      else
        puts "Invalid entry, Please enter 1 to be X and 2 to be O"  
      end 
    end
  end

  def first?
    @current_player, @next_player = human_player, computer
  end

  def game_loop
    while board.game_over? == false  
      if current_player == human_player
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
    board.print_grid
    puts "select a square by entering 1-9"
    valid = false
    until valid 
      move = gets.chomp
      return valid = true if validate_move(move) 
    end
  end

  def validate_move(move)
    if board.get_moves.include?(@@move_map[move])
      board.set_move(@@move_map[move], human_player.team)
    else
      puts "invalid move enter a different number"
      false
    end  
  end

  def computer_move
    board.print_grid
    puts "Computer is making its move..."
    move = computer.make_move(board,computer.team)
    board.set_move(move,computer.team)
  end

  def switch_players
    @current_player, @next_player = @next_player, @current_player
  end

  def game_over
    if board.game_over? == :winner
      board.print_grid
      puts "#{next_player.team} is the winner!"
    else
      board.print_grid
      puts "Draw!"
    end  
  end
end
  
