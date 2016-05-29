class Menu
  attr_accessor :file, :budget, :possibilities, :items

  def initialize options={}
    @file = "menu.txt"

    # Complicated way of storing budget as cents

    #Get menu items

  end

  def to_cents amount
    (amount.to_f * 100).to_i
  end

  def budget
    @budget = File.open(@file, &:readline).gsub(/[^0-9.]/, "")
    # @budget = (@budget.to_f * 100).to_i
    to_cents @budget
  end

  def items
    @items = {}
    lines = File.readlines(@file).map &:strip
    lines[1..-1].each do |line|
      line = line.split(',')
      @items[line[0]] = line[1]
    end
    @items
  end

  def get_possibilities items
    @possibilities = []

    for i in 1..(items.length) do
      @possibilities = @possibilities + items.combination(i).to_a
    end
    @possibilities
  end
end
