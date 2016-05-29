require 'spec_helper'
require "menu"

describe Menu do
  it "has a file" do
    menu = Menu.new
    menu.file.should_not be_nil

    #menu = Menu.new(file: 'Bobs_burgers.txt')
    #menu.error.should
  end

  it "has a budget" do
    menu = Menu.new
    menu.budget.should_not be_nil
    menu.budget.should be_an Integer
  end

  xit "has menu items" do
    menu = Menu.new
    menu.items.should be_a Hash
  end

  it "finds all possibilities" do
    #SUBSETS - 1 (2^n - 1)
    menu = Menu.new
    menu.get_possibilities [1,2,3]
    menu.possibilities.length.should == 7
  end

  xit "it returns all purchasing options" do
    menu = Menu.new
    menu.options.should be_an Array
  end

end
