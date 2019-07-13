class Players
  class Human < Player
    attr_reader :token
    def initialize(token)
      @token = token
    end
    def move (input)
      puts "Where would you like to move?"
      input = gets.chomp
      input
    end
  end
end
