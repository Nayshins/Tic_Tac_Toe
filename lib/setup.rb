class Setup

  attr_accessor :board, :rules, :human_player, :computer, :game, :ui
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
    @game = Game.new(ui,rules,human_player,computer)
  end

  def start_game
    game.game_loop
  end

  def select_team
    team = { '1' => 'X', '2' => 'O'}
    ui.print_pick_team
    valid_entry = false
    until valid_entry
      entry = ui.get_team
      if team[entry] == 'X'
        @human_player = Player.new('X')
        @computer = Computer.new('O')
        valid_entry = true
      elsif team[entry] == 'O'
        @human_player = Player.new('O')
        @computer = Computer.new('X')
        valid_entry = true  
      else
        ui.print_invalid_entry
      end 
    end
  end

  def first
    if human_player.team == 'X'
      human_player.current_player = true
      computer.current_player = false
    else
      computer.current_player = true
      human_player.current_player = false
    end  
  end
end

