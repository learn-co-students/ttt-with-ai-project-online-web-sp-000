module Players

class Human < Player

  def move(board)
    puts "Please put a number from 1 to 9"
    input = gets.chomp
  end
end

end
