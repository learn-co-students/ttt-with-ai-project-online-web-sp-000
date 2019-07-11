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
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  def current_player
    board.turn_count.even? ? player_1 : player_2
  end
  def won?
    WIN_COMBINATIONS.each do |win_combo|
      if board.cells[win_combo[0]] == "X" && board.cells[win_combo[1]] == "X" && board.cells[win_combo[2]] == "X"
        return win_combo
      elsif
        board.cells[win_combo[0]] == "O" && board.cells[win_combo[1]] == "O" && board.cells[win_combo[2]] == "O"
        return win_combo
      else
        false
      end
    end
    false
  end
  def full?
    board.cells.none?{|i| i == " "}
  end
  def draw?
    won? == false && full? == true
  end
  def over?
    won? || draw?
  end
  def winner
    won? == false ? nil : board.cells[won?[0]]
  end
  def turn
    puts "Please enter 1-9:"
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
      board.display
    else
      turn
    end
  end
  def play
    while over? == false
      turn
    end
    if draw? == true
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end














end
