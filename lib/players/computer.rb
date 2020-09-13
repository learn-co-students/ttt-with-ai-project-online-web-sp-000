class Players
  class Computer < Player
  
  attr_accessor :board
  
  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
  ]
  
  
  CORNERS = [0, 2, 6, 8]
  
  
  def corners
    CORNERS.shuffle!
  end
  
  def center?
    board.cells[4] == " "
  end
  
  
  def corner
    corners.find {|corner| board.cells[corner] == " "}
  end
  
  
  def opposite
    case
      when board.taken?(1) && !board.taken?(9)
        9
      when board.taken?(9) && !board.taken?(1)
        1
      when board.taken?(3) && !board.taken?(7)
        7
      when board.taken?(7) && !board.taken?(3)
        3
      else
        nil
    end
  end

  def move(board)
    @board = board
    case
      when win_move != nil
        input = win_move + 1
      when block != nil
        input = block + 1
      when center?
        input = 5
      when opposite != nil && board.taken?(opposite_corner) != true
        input = opposite
      when corner
        input = corner + 1
      else
        until !board.taken?(input)
          input = (1..9).to_a.sample
        end
    end
    input.to_s
  end
  def other
    token == "X" ? "O" : "X"
  end
  def win_move
    win_row = WIN_COMBINATIONS.find do |combo|
      (board.cells[combo[0]] == token && board.cells[combo[1]] == token && board.cells[combo[2]] == " ") || (board.cells[combo[2]] == token && board.cells[combo[1]] == token && board.cells[combo[0]] == " ") || (board.cells[combo[0]] == token && board.cells[combo[2]] == token && board.cells[combo[1]] == " ")
    end
    
    if win_row != nil
      win_cell = win_row.find {|cell| board.cells[cell] == " "}
    end
  end
  
  
  def block
    win_row = WIN_COMBINATIONS.find do |combo|
      (board.cells[combo[0]] == other && board.cells[combo[1]] == other && board.cells[combo[2]] == " ") || (board.cells[combo[1]] == other && board.cells[combo[2]] == other && board.cells[combo[0]] == " ") || (board.cells[combo[2]] == other && board.cells[combo[0]] == other && board.cells[combo[1]] == " ")
    end
    if win_row != nil
      win_cell = win_row.find {|cell| board.cells[cell] == " "}
    end
  end

  end
end