class Menu
  attr_reader :file
  attr_accessor :budget, :items

  def initialize options={}
    unless options[:file].nil?
      unless File.file? options[:file]
        abort("Invalid file")
      end
    end
    @file = options[:file] || "menu.txt"

    @budget = File.open(@file, &:readline).gsub(/[^0-9.]/, "")
    self.get_items
  end

  # Parses string amounts to integer represented amount in cents
  def to_cents amount
    amount = amount.gsub(/[^0-9.]/, "")
    (amount.to_f * 100).to_i
  end

  # Reads file and returns hash of menu items and prices
  def get_items
    @items = {}
    lines = File.readlines(@file).map &:strip
    lines[1..-1].each do |line|
      line = line.split(',')
      @items[line[0]] = line[1]
    end
    @items
  end

  # Returns an array of every possible menu item combination
  def options
    self.items
    itemsArr = @items.keys
    @options = []
    for i in 1..(items.length) do
      @options = @options + itemsArr.combination(i).to_a
    end
    @options
  end

  # Returns a hash of menu item combinations with price sums
  def option_prices
    self.options
    @option_prices = {}
    @options.each do |option|
      price = 0
      option.each do |item|
        price += to_cents(@items[item])
      end
      @option_prices[option] = price
    end
    @option_prices
  end

  # Returns an array of combinations equal to the budget
  def combos
    self.option_prices
    combinations = @option_prices.select{|k,v| v == to_cents(@budget)}.keys
    unless combinations.empty? then combinations else "No exact price matches" end
  end

  # Retuns an array of combination within budget
  def affordable_combos
    self.option_prices
    combinations = @option_prices.select{|k,v| v <= to_cents(@budget)}.keys
    unless combinations.empty? then combinations else "You can't afford anything..." end
  end
end
