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
    [6,4,2],
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      all_positions_taken = win_combination.all? { |position| @board.cells[position] != " " }
      position_tokens = win_combination.map { |position| @board.cells[position] }
      if all_positions_taken == true && position_tokens.uniq.length == 1
        return win_combination
      end
    end
    return false
  end

  def draw?
    if @board.full? == false || self.won? != false
      return false
    else
      return true
    end
  end

  def over?
    if self.won? != false || self.draw? == true
      return true
    else
      return false
    end
  end

  def winner
    winning_combination = self.won?
    if winning_combination != false
      return @board.cells[winning_combination[0]]
    else
      return nil
    end
  end

  def turn
    puts "Please enter your turn (between 1-9)"
    user_input = self.current_player.move(@board)
    if @board.valid_move?(user_input) == true
      @board.update(user_input, self.current_player)
    else
      self.turn
    end
  end


  def play
    until self.over? == true
      self.turn
    end
    if self.won? != false
      puts "Congratulations #{self.winner}!"
    elsif self.draw? == true
      puts "Cat's Game!"
    end
  end

end
