require_relative "lib/menu"

def print_options options
  if options.is_a?(String)
    puts options
    puts ''
  else
    options.each_with_index do |option, index|
      puts "Option #{index+1}:"
      puts option
      puts ''
    end
  end
end

file = ARGV.first

m = Menu.new file: file

print_options m.combos

user_input = ''

while user_input != "n"
  puts "Update budget?: (y/n)"
  user_input = $stdin.gets.chomp

  if user_input == "y"
    puts "New Budget:"
    budget = $stdin.gets
    m.budget = budget
    print_options m.combos
  else
    break
  end
end
