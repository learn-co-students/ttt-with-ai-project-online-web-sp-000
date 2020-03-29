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
    if board.turn_count % 2 == 0
      player_1
    else
      player_2
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      index_0 = combo[0]
      index_1 = combo[1]
      index_2 = combo[2]

      position_1 = board.cells[index_0]
      position_2 = board.cells[index_1]
      position_3 = board.cells[index_2]
      position_1 == position_2 && position_2 == position_3 && position_2 != " "
    end
  end

  def draw?
    !board.cells.include?(" ") && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      board.cells[won?[0]]
    else
      nil
    end
  end

  def turn
    puts "#{current_player.token}, please choose a number 1-9:"
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
    else
      turn
    end
  end

  def how_many
    puts "How many players - 0, 1, or 2?"
    input = gets.strip
    if input == "2"
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Human.new("O")
      play
    elsif input == "1"
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Computer.new("O")
      play
    elsif input == "0"
      @player_1 = Players::Computer.new("X")
      @player_2 = Players::Computer.new("O")
      play
    end
  end

  def play
    puts "Welcome to Tic Tac Toe!"
    # puts "How many players - 0, 1, or 2?"
    # input = gets.strip
    # if input == "2"
    #   @player_1 = Players::Human.new("X")
    #   @player_2 = Players::Human.new("O")
    # elsif input == "1"
    #   @player_1 = Players::Human.new("X")
    #   @player_2 = Players::Computer.new("O")
    # elsif input == "0"
    #   @player_1 = Players::Computer.new("X")
    #   @player_2 = Players::Computer.new("O")
    # end
    until over? do
      board.display
      turn
    end
    if won?
      board.display
      puts "Congratulations #{winner}!"
    else
      board.display
      puts "Cat's Game!"
    end
  end

end
