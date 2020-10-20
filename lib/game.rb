class Game

  WIN_COMBINATIONS = [[0, 1, 2],
                      [3, 4, 5],
                      [6, 7, 8],
                      [0, 4, 8],
                      [2, 4, 6],
                      [0, 3, 6],
                      [1, 4, 7],
                      [2, 5, 8]]

  attr_accessor :board, :player, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count
    if board.turn_count.even?
      self.player_1
    elsif board.turn_count.odd?
      self.player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each {|win_combo|
      index_0 = win_combo[0]
      index_1 = win_combo[1]
      index_2 = win_combo[2]

      position_1 = board.cells[index_0]
      position_2 = board.cells[index_1]
      position_3 = board.cells[index_2]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combo
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combo
      end
    }
    return false
  end

  def draw?
    if !won? && board.full?
      return true
    else
      return false
    end
  end

  def over?
    if board.full? || won? || draw?
      return true
    else
      return false
    end
  end

  def winner
    winner = []
    winner = won?
      if winner == false
        return nil
      else
        if board.cells[winner[0]] == "X"
          return "X"
        else
          return "O"
        end
      end
  end

  def turn
    puts "Please enter 1-9:"
    input = current_player.move(input)
      if board.valid_move?(input) == true
        board.update(input, current_player)
        board.display
      else
        turn
      end
  end

  def play
    until over? == true
      turn
    end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
  end



end
