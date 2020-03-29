
module Players
  class Human < Player

    attr_accessor :name

    def initialize(name = nil)
      super
      @name = name
    end

    def move(board)
      input = gets.strip
    end

  end
end
