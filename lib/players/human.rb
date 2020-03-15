
class Players < Player
  class Human < Players

    def move(input)
      puts "What's your move bro?"
      input = gets.chomp
      input
    end
  end
end
