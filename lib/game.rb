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
    WIN_COMBINATIONS.each do |combo|
      if combo.all? {|x| @board.cells[x] == "X"}
        return combo
      end
      if combo.all? {|x| @board.cells[x] == "O"}
        return combo
      end
    end
    return false
  end

  def draw?
    if (!won? && @board.full?)
      return true
    end
    return false
  end

  def over?
    if (draw? || won?)
      return true
    end
    return false
  end

  def winner
    if won?
      return @board.cells[won?[0]]
    end
    return nil
  end

  def turn
    input = current_player.move(board)
    if @board.valid_move?(input)
      @board.update(input, current_player)
      @board.display
    else
      turn
    end
  end

  def play
    while !over?
      turn
    end
    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
  end
end