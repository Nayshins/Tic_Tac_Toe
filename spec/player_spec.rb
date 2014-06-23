require "spec_helper"

describe "Player" do
  before :each do
    @player = Player.new('X')
  end
  describe "#initialize" do
    it "is initialized with a team" do
      @player.team.should eq('X')
    end
  end
end