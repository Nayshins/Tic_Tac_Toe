require "spec_helper"

describe "player" do
  before :each do
    @player = Player.new({ name: "Jake", team: "X" })
  end
  context "#initialize" do
    describe "with valid information" do 
      it "takes a hash named args and returns a player object" do
        @player.should be_an_instance_of Player
      end
    end  
    describe "with invalid information" do
      it "raises an exception when no args are given" do
        expect { Player.new({}) }.to raise_error
      end
      it "raises an exception when 1 arg is given" do
        expect { Player.new({ name: "Jake" })}.to  raise_error
      end
    end
  end
  describe "#name" do
    it "returns the correct name" do
      @player.name.should eq("Jake")
    end  
  end
  describe "#team" do
    it "returns the correctt team" do
      @player.team.should eq("X")    
    end
  end   
end