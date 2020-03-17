
class Players < Player
  class Human < Players

    def move(board, timer = 0)
      puts "What's your move bro?"
      input = gets.chomp
      input
    end
  end
end
