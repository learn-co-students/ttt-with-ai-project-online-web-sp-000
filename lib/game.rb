require "pry"

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
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count.odd? ? player_1 : player_2
  end

  def won?
  WIN_COMBINATIONS.each do |win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    slot_1 = board.cells[index_0]
    slot_2 = board.cells[index_1]
    slot_3 = board.cells[index_2]

    if slot_1 == "X" && slot_2 == "X" && slot_3 == "X"
      return win_combo
    elsif slot_1 == "O" && slot_2 == "O" && slot_3 == "O"
      return win_combo
    end
  end
  false
end

def draw?
    if won? == false && board.full? == true
      true
    end
end

def over?
    if draw? == true || won? != false
      true
    end
end

def winner
    if won?
      combination = won?
      @board.cells[combination[0]] # X or O
    end
end

def turn
  user_input = current_player.move(board)
    if board.valid_move?(user_input)
      board.update(user_input, current_player)
    else
      turn
  end
end

def play
  turn until over?
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
      puts "Cat's Game!"
    end
  end
end
