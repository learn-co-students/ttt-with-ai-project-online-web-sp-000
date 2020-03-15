
class Player::Human < Player

    def move(input)
      puts "What's your move bro?"
      input = gets.chomp
      input
    end
end
