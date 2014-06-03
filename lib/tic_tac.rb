# Create game class
# create negamax search
# => add alpha beta
#

class Board
  attr_accessor :grid, :solutions
  
  def initialize
    @grid = [' '] * 9
  end

  def locations(piece) #returns the index of 'X', 'O', or ' '
    grid.each_index.select { |index| grid[index] == piece }
  end

  def get_moves
    return locations(' ')
  end

  def make_solutions
    get_rows + get_cols +  get_diagonals
  end

  def get_rows
    grid.each_slice(3).to_a  
  end

  def get_cols
    grid.each_slice(3).to_a.transpose # returns the transpose of rows = columns
  end

  def get_diagonals
    [[grid[0], grid[4], grid[8]], [grid[2], grid[4], grid[6]]]
  end

  def print_grid
    puts 
    puts " #{grid[0]} | #{grid[1]} | #{grid[2]}"
    puts "---+---+---"
    puts " #{grid[3]} | #{grid[4]} | #{grid[5]}"
    puts "---+---+---"
    puts " #{grid[6]} | #{grid[7]} | #{grid[8]}"
    puts
  end

  def winner?
    make_solutions.each do |solution|
      next if solution[0] == ' '
      return true if solution.all? { |ele| solution[0] == ele }
    end
    false
  end

  def draw?
    return true if get_moves == []
    false
  end

  def game_over?
    winner? || draw?
  end
end

class Player
  attr_accessor :team

  def initialize(team) # 'X' or 'O'
    @team = team
  end
end
