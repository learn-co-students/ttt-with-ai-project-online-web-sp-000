# learn spec/03_human_player_spec.rb

module Players
  class Human < Player
    def move(board)
      puts "Please enter 1-9:"
      gets.strip
    end
  end
end