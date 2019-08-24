class Game
  attr_accessor :board, :player_1, :player_2, :game

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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    @game = self
  end

  def board
    @board
  end

  def player_1
    @player_1
  end

  def player_2
    @player_2
  end

  def game
    @self
  end

  def current_player
    if board.turn_count.odd?
      @player_2
    else
      @player_1
    end
  end


def won?
  combination = WIN_COMBINATIONS.detect do |combo|
    @board.cells[combo[0]] != " " && @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]]
  end
end

  def full?
    count = 0
    board.cells.each do |position|
      if position != nil && position != " "
        count += 1
      end
    end
    if count == 9
      true
    else
      false
    end
  end

  def draw?
    if full?
      if won?
        false
      else
        true
      end
    else
      if won?
        false
      end
    end
  end

  def over?
    if won? || full? || draw?
      true
    else
      false
    end
  end

  def winner
    if won? == nil
      nil
    else
      win_combo = won?
      board.cells[win_combo[0]]
    end
  end

  def turn
    player_move = current_player.move(@board) until board.valid_move?(player_move)
    board.update(player_move, current_player)
  end

  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
