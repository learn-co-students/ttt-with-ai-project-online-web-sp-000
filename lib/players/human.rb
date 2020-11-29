require "/home/allisunflower/ttt-with-ai-project-online-web-sp-000/lib/player.rb"

module Players
  class Human < Player
    
    attr_accessor :input
    
    def move(input)
      puts "Where would you like to move? Please enter a number 1-9:"
      @input = gets
    end
  end
  
end