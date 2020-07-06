require 'pry'


class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    #binding.pry
    board.turn_count % 2 == 0 ? player_1 : player_2


  end

  def won?


    WIN_COMBINATIONS.each do |win_combo|
      #binding.pry

      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]

      position_1 = @board.cells[win_index_1]
      position_2 = @board.cells[win_index_2]
      position_3 = @board.cells[win_index_3]


      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combo
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combo
      end

    end
    return false

  end

  def draw?
    if !won? && board.full?
      true
    else
      false
    end
  end

  def over?
    if won? || draw? || board.full?
      true
    else
      false
    end
  end

  def winner
    won_token = won?
    if !won_token
      return nil
    else
      if @board.cells[won_token[0]] == "X"
        return "X"
      else
        return "O"
      end
    end
  end

  def turn
    #binding.pry
    current_move = current_player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      @board.update(current_move, current_player)
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end


end
