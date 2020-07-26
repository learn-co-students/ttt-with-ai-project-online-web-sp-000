module Players

  class Human < Player
    def move(board)
      puts "#{self.token}: Enter your move [1-9]:"
      input = gets.strip
    end
  end

end
