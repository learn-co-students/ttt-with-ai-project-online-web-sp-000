module Players
class Human < Player
  attr_reader :input
​
def move(input)
  puts "Please input a #1-9."
  input = gets.strip
  input
end
def input=(input)
  puts "Please enter 1-9:"
  @input = gets.strip
  @input
end
​
end
end
