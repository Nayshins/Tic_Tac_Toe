require "spec_helper"
# TODO: Redo these tests. No Bueno
describe "Game" do
  let(:board)  { Board.new  }  
  let(:ui)     { Console.new(board) } 
  let(:rules)  { Rules.new(board) }
  let(:player) { PLayer.new(x) } 
  let(:game)   { Game.new }
end