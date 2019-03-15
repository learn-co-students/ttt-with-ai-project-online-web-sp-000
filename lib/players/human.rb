module Players
class Human < Player

    def move(board)
      puts "Player #{self.token} - Please input a #1-9."
      input = gets.strip
      input
    end

end
end
