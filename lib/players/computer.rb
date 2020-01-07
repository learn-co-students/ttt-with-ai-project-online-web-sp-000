module Players
  class Computer < Player

    def move(board)
    # binding.pry
  #  player = game.current_player
  #  pmove = player.move(board)
    unless game.over?(board) || !valid_move?(board)
      return board.position


#    if board.valid_move?(board)
#    board.update(input, player)
#    end
  end
end

  end
end
