class Game

attr_accessor :player_1, :player_2, :board, :pieces

def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  @pieces =["X", "O"]
@player_1 = player_1
@pieces.delete(player_1.token)
@player_2 = player_2
@board = board

end

  WIN_COMBINATIONS = [
   [0,1,2],
   [3,4,5],
   [6,7,8],
   [2,4,6],
   [0,4,8],
   [0,3,6],
   [2,5,8],
   [1,4,7],
  ]

  def current_player
    turns = board.turn_count % 2
    if turns == 0
      return player_1
    else
      return player_2
  end
  end

  def won?
  if board.cells.all? == " " || board.cells.all? == nil
    return nil
  else
  WIN_COMBINATIONS.detect do |win|
  board.cells[win[0]] == "X" && board.cells[win[1]] == "X" && board.cells[win[2]] == "X" ||
  board.cells[win[0]] == "O" && board.cells[win[1]] == "O" && board.cells[win[2]] == "O"

    end
  end
  end

  def draw?
    if  won? == nil && board.full? == true
      return true
    end
  end

  def over?
  if won? != nil || draw? == true
    return true
  end
  end

  def winner
  if over? == true && won? != false
    return board.cells[won?[0]]
  else
    return nil
  end
  end

  def turn
    current_player.move(board)
  end

  def play
    board.display
  until over? == true
    turn
    board.display
  end
  if draw? == true
    puts "Cat's Game!"
  elsif won? != nil
    v = winner
    puts "Congratulations #{v}!"

  end
  end

end
