class Player::Computer < Player
  def move (board, timer = 0)
    # binding.pry
    timer <= 0 ? @timer = 0.01 : @timer = timer
    move = []
    board.cells.select {|c| c == " "}.each.with_index(1) do |d, i|
      move << "#{i}"
    end
    move[rand(move.length)]
  end
end
