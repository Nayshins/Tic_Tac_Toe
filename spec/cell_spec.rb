require 'spec_helper'

describe "Cell" do
  
  context "#initialize" do
    it "is initialized with a default value of '' " do
      cell = Cell.new
      cell.value.should eq('')
    end
    it "is initialized with a value of X" do
      cell = Cell.new('X')
      cell.value.should eq('X')
    end
  end
end