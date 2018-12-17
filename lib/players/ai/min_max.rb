class MinMax
  def next_move(board)
    @test = true
    min_max(board)[1]
  end
  
  def min_max(board)
    return [score(board), nil] if board.over?
    
    scores = []

    board.cells.each_with_index do |cell, index|
      if !board.taken_int?(index)
        possible_game = Board.new(board.cells.dup)
        possible_game.cells[index] = possible_game.current_player
        scores.push([min_max(possible_game)[0], index])
      end
    end

    if board.current_player == "X"
      scores.max
    else
      scores.min
    end
  end



  def score(board)
    if board.winner.nil?
      0
    elsif board.winner == "X"
      +10 + board.turn_count
    else
      -10 - board.turn_count
    end
  end
end