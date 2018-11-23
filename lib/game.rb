class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize(player_1 = nil, player_2 = nil, board = nil)
    @player_1 = player_1 || Players::Human.new("X")
    @player_2 = player_2 || Players::Human.new("O")
    @board = board || Board.new
  end

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    Game.won?(@board.cells)
  end

  def self.won?(cells)
    WIN_COMBINATIONS.find do |win_combination|
      position_1 = cells[win_combination[0]]
      position_2 = cells[win_combination[1]]
      position_3 = cells[win_combination[2]]
      (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
        (position_1 == "O" && position_2 == "O" && position_3 == "O")
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    combo = won?
    if combo
      @board.cells[combo[0]]
    end
  end

  def turn
    player = current_player
    move = player.move(board)

    if @board.valid_move?(move)
      @board.update(move, player)
    else
      puts "Please enter a valid move."
      turn
    end
  end

  def play
    until over?
      turn
    end

    @board.display

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

  def self.start
    puts "Hi! Welcome to Tic-Tac-Toe!"
    puts "How many players? 0, 1, 2 or wargames?"
    player_count = gets.strip

    if player_count == "wargames"
      wargames
      return
    end

    player_count = player_count.to_i

    puts "Who should go first? Player 1 (press 1) or Player 2 (press 2)? The first player is \"X\"."
    first_player = gets.strip.to_i

    if player_count == 0
      player_1 = Players::Computer.new("X")
      player_2 = Players::Computer.new("O")
    elsif player_count == 1
      if first_player == 1
        player_1 = Players::Human.new("X")
        player_2 = Players::Computer.new("O")
      else
        player_1 = Players::Computer.new("X")
        player_2 = Players::Human.new("O")
      end
    else
      player_1 = Players::Human.new("X")
      player_2 = Players::Human.new("O")
    end

    Game.new(player_1, player_2).play
    puts "Would you like to play again? Y/N?"
    play_again = gets.strip

    if play_again == "Y"
      start
    else
      puts "Thank you for playing!"
    end
  end

  def self.wargames
    x = []
    o = []
    c = []

    100.times do
      player_1 = Players::Computer.new("X")
      player_2 = Players::Computer.new("O")

      game = Game.new(player_1, player_2)
      game.play

      if game.winner == "X"
        x << game
      elsif game.winner == "O"
        o << game
      else
        c << game
      end
    end

    puts "X: #{x.count}"
    puts "O: #{o.count}"
    puts "C: #{c.count}"
  end
end