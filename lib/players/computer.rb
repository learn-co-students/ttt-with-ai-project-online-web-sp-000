class Player::Computer < Player
  def move (board)
    move = []
    board.cells.select {|c| c == " "}.each.with_index(1) do |d, i|
      move << "#{i}"
    end
    move[rand(move.length)]
  end
end
