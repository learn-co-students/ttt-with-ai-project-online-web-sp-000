class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [0,3,6],
    [0,4,8],
    [1,4,7],
    [2,5,8],
    [3,4,5],
    [6,7,8],
    [6,4,2]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O") , board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
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

  def current_player
    if board.turn_count.even?
      @player_1
    else
      @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each {|win_combo|
    position_1 = board.cells[win_combo[0]]
    position_2 = board.cells[win_combo[1]]
    position_3 = board.cells[win_combo[2]]

    return win_combo if ((position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O"))
    }
    return false
  end

  def draw?
    !won? && board.full? ? true : false
  end

  def over?
    draw? || won? ? true : false
  end

  def winner
    if won = won?
      board.cells[won.first]
    end
  end

  def turn
    puts "It's Player #{current_player.token}'s turn!\n"
    puts "What's your move? (1-9):\n"
    board.display

    user_input = current_player.move(board)

    if board.valid_move?(user_input)
      board.update(user_input, current_player)
    else
      puts "Invalid Input. Please enter a valid number!"
      turn
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
    board.display
  end

end