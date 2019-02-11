require_relative "../player.rb"
module Players
class Human < Player
  
  def move(board)
    puts "Please enter your selection"
    selection = gets.strip
    selection
  end
  
end
end