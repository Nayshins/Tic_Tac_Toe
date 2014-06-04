require "spec_helper"

describe "Computer" do
  
  before :all do
    @computer = Computer.new('X')
  end

  describe "#initialize" do
    it "initializes with a team" do
      @computer.team.should eq('X')
    end
  end
end