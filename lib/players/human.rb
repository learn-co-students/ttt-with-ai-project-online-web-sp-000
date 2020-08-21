module Players
  class Human < Player
    attr_accessor :game, :name
    def move(board)
      puts "#{@game.current_player.name}, please select a square 1-9."
      gets.strip
    end
  end
end
