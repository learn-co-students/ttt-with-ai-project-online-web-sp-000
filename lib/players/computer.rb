class Player::Computer < Player
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]]

  def move (board, timer = 0)
    # binding.pry
    timer <= 0 ? @timer = 0.01 : @timer = timer
    move = []
    board.cells.each.with_index(1) do |d, i|
      if d == " "
        move << "#{i}"
      end
    end
    case
      when win != nil
        win
      when win = nil
        move[rand(move.length)]
      end
    end
  end

  def win
    WIN_COMBINATIONS.find do |win_comb|
      win = win_comb.select {|x| x == " "} if win_comb[0] == token && (win_comb[1] == token || win_comb[2] == token) || (win_comb[1] == token && win_comb[2] == token)
    end
  end
