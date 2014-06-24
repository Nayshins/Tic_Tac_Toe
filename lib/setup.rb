class Setup
  # needs board
  # setup methods
  # select team
  # start game

  attr_accessor :board, :human_player, :computer_player, :current_player, :next_player, :game
  def initialize
    @board = Board.new
    @ui = Console.new
  end

  def new_game
    setup_game
    start_game
  end

  def setup_game
    puts "Welcome to Unbeatable Tic Tac Toe..."
    select_team
    first
    @game = Game.new(board,human_player,computer_player, 
                    current_player, next_player)
  end

  def start_game
    @game.game_loop
  end

  def select_team
    team = { '1' => 'X', '2' => 'O'}
    puts "Please enter 1 to be X or 2 to be O"
    valid_entry = false
    until valid_entry
      entry = gets.chomp
      if team[entry] == 'X'
        @human_player = Player.new('X')
        @computer_player = Computer.new('O')
        valid_entry = true
      elsif team[entry] == 'O'
        @human_player = Player.new('O')
        @computer_player = Computer.new('X')
        valid_entry = true  
      else
        puts "Invalid entry, Please enter 1 to be X and 2 to be O"  
      end 
    end
  end

  def first
    if human_player.team == 'X'
      @current_player = human_player
      @next_player = computer_player
    else
      @current_player = computer_player
      @next_player = human_player
    end  
  end

end

