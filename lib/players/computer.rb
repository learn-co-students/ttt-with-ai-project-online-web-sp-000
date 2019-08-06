module Players
  class Computer < Player
    def move(board)
      rand(10).to_s
    end
  end
end


### create more intelligent game playing here
