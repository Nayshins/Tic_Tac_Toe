class Setup
  # needs board
  # setup methods
  # select team
  # start game

  attr_accessor :board, :rules, :human_player, :computer_player, 
                :current_player, :next_player, :game, :ui
  def initialize
    @board = Board.new
    @rules = Rules.new(board)
    @ui = Console.new(board)
  end

  def new_game
    setup_game
    start_game
  end

  def setup_game
    ui.print_welcome
    select_team
    first
    @game = Game.new(ui,rules,human_player,computer_player, 
                    current_player, next_player)
  end

  def start_game
    @game.game_loop
  end

  def select_team
    team = { '1' => 'X', '2' => 'O'}
    ui.print_pick_team
    valid_entry = false
    until valid_entry
      entry = ui.get_team
      if team[entry] == 'X'
        @human_player = Player.new('X')
        @computer_player = Computer.new('O')
        valid_entry = true
      elsif team[entry] == 'O'
        @human_player = Player.new('O')
        @computer_player = Computer.new('X')
        valid_entry = true  
      else
        ui.print_invalid_entry
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

