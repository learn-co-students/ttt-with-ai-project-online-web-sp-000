module Players
class Human < Player
def move(input)
  puts "Please input a #1-9."
  input = gets.strip
  input
end
end
end 
