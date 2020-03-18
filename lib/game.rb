class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize(player1=Players::Human.new("X"), player2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player1
    @player_2 = player2
  end

  def current_player
    if @board.turn_count % 2 == 0
      @player_1
    else
      @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]
      if @board.cells[win_index_1] == "X" && @board.cells[win_index_2] == "X" && @board.cells[win_index_3] == "X"
        return win_combo
      elsif @board.cells[win_index_1] == "O" && @board.cells[win_index_2] == "O" && @board.cells[win_index_3] == "O"
        return win_combo
      end
    end
    return false
  end

  def draw?
    if @board.full? && !won?
      return true
    else
      return false
    end
  end

  def over?
    if draw? || won?
      return true
    else
      return false
    end
  end

  def winner
      if won?
        win_combo = won?
        @board.cells[win_combo[0]]
      end
  end

  def turn

    player = current_player
    player_input = player.move(@board)
    if @board.valid_move?(player_input)
      @board.update(player_input, player)
    else
      turn
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      winning_token = winner
      @board.display
      puts "Congratulations #{winning_token}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
