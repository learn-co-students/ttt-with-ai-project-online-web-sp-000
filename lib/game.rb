class Game
attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,4,8],[2,4,6], [0,3,6], [1,4,7],[2,5,8]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if board.turn_count.even?
    player_1
    else
    player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      win_index1 = win_combo[0]
      win_index2 = win_combo[1]
      win_index3 = win_combo[2]

      pos1 = board.cells[win_index1]
      pos2 = board.cells[win_index2]
      pos3 = board.cells[win_index3]

      if pos1 == "X" && pos2 == "X" && pos3 == "X"
        return win_combo
      elsif  pos1 == "O" && pos2 == "O" && pos3 == "O"
        return win_combo
       end
     end
      false
  end

  def draw?
    if board.full? && !won?
      true
    end
  end

  def over?
    if draw? || won?
      true
    end
  end

  def winner
    if !won? || draw?
      nil
    else winning_character = won?[1]
      board.cells[winning_character]
    end
  end

  def turn
    player = current_player
    current_move = player.move(player.token)
    if !board.valid_move?(current_move)
      current_move =player.move(player.token)
    else
      board.update(current_move, current_player)
    end
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif over?
      puts "Congratulations #{winner}!"
    end
  end

end
