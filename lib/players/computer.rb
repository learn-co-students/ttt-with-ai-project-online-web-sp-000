module Players
  class Computer < Player

    def move(board)
      Game::WIN_COMBINATIONS

      if(board.empty?){
        board.update(4, self.token)
      }
    end

  end
end
