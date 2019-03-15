module Players
class Human < Player
  attr_reader :input
def move(board)
  puts "Please input a #1-9."
  input = gets.strip
  input
end

end
end
