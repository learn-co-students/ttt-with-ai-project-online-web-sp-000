class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def initialize(p1 = Players::Human.new("X"), p2 = Players::Human.new("O"), board = Board.new)
    @player_1 = p1; @player_2 = p2; @board = board
  end

  def current_player
    return @player_1 if @board.turn_count % 2 == 0
    return @player_2
  end

  def won?
    board.won?
  end

  def draw?
    board.draw?
  end

  def over?
    board.over?
  end

  def winner
    board.winner
  end

  def turn
    input = current_player.move(board)
    if @board.valid_move?(input)
      @board.update(input, current_player)
    else
      turn
    end
  end

  def play
    Gem.win_platform? ? (system "cls") : (system "clear")
    while !over?
      puts "Player #{current_player.token}'s turn:"
      puts "Please while while the AI Processes" if (9 - board.turn_count) > 7 && current_player.is_a?(Players::Computer)
      @board.display
      sleep(2) if current_player.is_a?(Players::Computer) && board.turn_count > 1
      turn
      Gem.win_platform? ? (system "cls") : (system "clear")
    end
    @board.display
    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
  end
end