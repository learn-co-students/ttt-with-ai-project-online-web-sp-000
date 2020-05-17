require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]
  @board = []

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board= Board.new)
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
    WIN_COMBINATIONS.each {|combo|
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]

    position_1 = board.cells[win_index_1] #slot 1
    position_2 = board.cells[win_index_2] #slot 2
    position_3 = board.cells[win_index_3] #slot 3

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return combo
    end}
    return false
  end

  def draw?
    board.full? && !won? #no one wins and full board
  end

  def over?
    won? || draw? #true when won and true when draw
  end

  def winner
    combo = self.won?
    if not self.won?
      nil
    else
      if board.cells[combo[0]] == "X"
        "X"
      else
        "O"
      end
    end
  end

  def turn
    puts "Please enter a number from 1-9."
    move = current_player.move(board) #gets
    if board.valid_move?(move) #if move is valid
      board.update(move, current_player)
      board.display
    else
      turn
    end
  end

  def play
    until over? #over checks draw? and checks won?
      turn
    end
    if draw? == true
      puts "Cat's Game!"
    else puts "Congratulations #{winner}!"
    end
  end

end
