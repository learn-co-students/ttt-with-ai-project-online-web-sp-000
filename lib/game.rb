class Game
  # has board, player1, player2
  attr_accessor :board, :player_1, :player_2

  # can define win conditions
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ]

  # can start a game: create a new board and two players (human or computer, each w/ token)
  def initialize(player_1=nil, player_2=nil, board=nil)
    if board == nil
      @board = Board.new
    else
      @board = board
    end

    if player_1 == nil
      @player_1 = Players::Human.new("X")
    else
      @player_1 = player_1
    end

    if player_2 == nil
      @player_2 = Players::Human.new("O")
    else
      @player_2 = player_2
    end
  end

  # can control gameplay, monitors game state and ends game (if over)
  def play
    board.display

    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

  # can execute a single turn:gets player move, validates move, updates then displays board
  def turn
    input = current_player.move(board)

    if board.valid_move?(input)
      board.update(input, current_player)
      board.display
    else
      turn
    end
  end

  # can maintain current player (switches between turns)
  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  # can determine winner
  def winner
    board.cells[won?[0]] if won?
  end

  # can check game state
  def over?
    won? || board.full? || draw?
  end

  # checks if board full and no win
  def draw?
  	board.full? && !won?
  end

  # can check if game won by either player, returns winning token
  def won?
    win_array = WIN_COMBINATIONS.select do |win_combo|
      win_combo.all? { |win_index| board.cells[win_index] == "X"} ||
      win_combo.all? { |win_index| board.cells[win_index] == "O"}
    end
    win_array[0]
  end
end
