class Player::Computer < Player
  def move (board, timer = 0)
    # binding.pry
    timer <= 0 ? @timer = 0.01 : @timer = timer
    move = []
    board.cells.each.with_index(1) do |d, i|
      if d == " "
        move << "#{i}"
      end
      # binding.pry
    end
    move[rand(move.length)]
  end
end
