module Players
  class Computer < Player
<<<<<<< HEAD

    def initialize(token)
      super(token)
    end
    
=======
>>>>>>> 0db86b9d25e627751506d247ce46807ee9627528
    def move(board)
      (rand(8) + 1).to_s
    end
  end
end
