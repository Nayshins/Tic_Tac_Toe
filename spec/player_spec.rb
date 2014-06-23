require "spec_helper"

describe "Player" do
  
  let(:player) { Player.new('X') }
  
  describe "#initialize" do
    it "is initialized with a team" do
      expect(player.team).to eq('X')
    end
  end
end