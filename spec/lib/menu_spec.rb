require 'spec_helper'
require "menu"

describe Menu do
  let(:menu){Menu.new}
  let(:menu2){Menu.new file: 'menu2.txt'}
  it "has/accepts a file" do
    menu.file.should_not be_nil

    menu2.file.should eq 'menu2.txt'
  end

  it "has a budget" do
    menu.budget.should_not be_nil
  end

  it "can update its budget" do
    menu.budget.should eq '15.05'
    menu.budget = '$4.50'
    menu.budget.should eq '$4.50'
  end

  it "has menu items" do
    menu.items.should be_a Hash
  end

  it "it returns all purchasing options" do
    menu.file.should eq "menu.txt"
    menu.options.should be_an Array
    menu.options.length.should be 63
  end

  it "returns an array of combinations with exact price match" do
    menu.combos.should eq "No exact price matches"
    menu.items['Fish tacos'] = '$15.05'
    menu.combos.first.should eq ['Fish tacos']
  end

end
