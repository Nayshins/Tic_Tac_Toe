require 'spec_helper'

describe "Setup" do

  let(:setup) { Setup.new }

  describe "#new_game" do
    it "calls #set_up_game and #start_game" do
      expect(setup).to receive(:setup_game)
      expect(setup).to receive(:start_game)
      setup.new_game
    end  
  end

  describe "#setup_game" do
    it "runs the setup game logic" do
      expect(setup).to receive(:select_team)
      expect(setup).to receive(:first)
      setup.setup_game 
    end

    it "creates a new instace of the Game class" do  
      expect(setup).to receive(:select_team)
      expect(setup).to receive(:first)
      setup.setup_game
      expect(setup.game).to be_an_instance_of Game
    end
  end
end