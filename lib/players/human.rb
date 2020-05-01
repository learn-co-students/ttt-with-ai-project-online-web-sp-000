class Players
  class Human < Player

    attr_accessor :name 

    def move(board) #takes in the instance of a board
      gets.strip
    end

  end
end
