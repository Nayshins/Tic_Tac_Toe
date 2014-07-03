require "spec_helper"
# TODO: Redo these tests. No Bueno
describe "Game" do
  
  let(:board)    { Board.new  }  
  let(:ui)       { Console.new(board) } 
  let(:rules)    { Rules.new(board) }
  let(:player)   { Player.new('X') }
  let(:computer) { Computer.new('O')} 
  let(:game)     { Game.new(ui,rules,player,computer) }

end