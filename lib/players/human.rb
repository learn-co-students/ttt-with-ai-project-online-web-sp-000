module Players
  class Human < Player

attr_accessor :input

    def move(input)
      input = gets.chomp
      input
    end

  end
end
