class Players::Computer < Player
  attr_accessor :marker
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]

  def move(board)
    if board.turn_count == 0 || board.turn_count == 1
      if self.open_spots(board).include?(5)
        "5"
      end
    elsif one_off_win?(board) && open_spots(board).include?(one_off_win?(board))
      spot = one_off_win?(board)
      spot.to_s
    else
      choices = open_spots(board)
      choices[rand(choices.size - 1)].to_s
    end
  end

  def open_spots(board)
    spots = []
    index = 0
    9.times do
      if board.cells[index] == " "
        spots << (index + 1)
      end
      index += 1
    end
    spots
  end

  def one_off_win?(board)
    one_off = false
    combo = []
    WIN_COMBINATIONS.each do |win|
      combo = win.collect { |i| board.cells[i]}
      if combo.one?(" ")
        one_off = combo.index(" ") + 1
      end
    end
    one_off
  end
end
