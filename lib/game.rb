class Game
attr_accessor :board, :player_1, :player_2

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]


def full?(board)
  if board.any? {|index| index == nil || index == " "}
    return false
  else
    return true
  end
end

def won?
  WIN_COMBINATIONS.detect do |combo|
    @board_cells[combo[0]] == @board.cells[combo[1]] &&
    @board.cells[combo[1]] == @board.cells[combo[2]] &&
    @board.taken?(combo[0]+1)
end
end

def draw?
  @board.full? && !won?
  end

end
