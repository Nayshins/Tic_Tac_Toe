# Create game class
# create negamax search
# => add alpha beta
#

class Game
  attr_accessor :board, :player
  
  def initialize
    @board = [' '] * 9
    @player = 'X'
    @current_player = self.player
  end

  def locations(piece) #returns the index of 'X', 'O', or ' '
    board.each_index.select { |index| board[index] == piece }
  end
end