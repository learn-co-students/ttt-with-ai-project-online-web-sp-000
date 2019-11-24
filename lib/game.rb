class Game

  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize(player_1=nil, player_2=nil, board=nil)
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

    if board == nil
      @board = Board.new
    else
      @board = board
    end

  end

  def current_player

    next_turn = @board.turn_count + 1
    next_turn.odd? ? @player_1 : @player_2

  end

  def won?

    winning_combo = []
    WIN_COMBINATIONS.each do |combo|
      if @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]]
        winning_combo << combo[0]
        winning_combo << combo[1]
        winning_combo << combo[2]
      end
    end

    if winning_combo.empty?
      false
    else
      winning_combo
    end
  end

  def draw?

    if !self.won? && @board.full?
      true
    else
      false
    end

  end

  def over?

    if self.won? || self.draw?
      true
    else
      false
    end

  end

  def winner

    winning_combo = self.won?
    if self.won?
      winning_player = @board.cells[winning_combo[0]]
    end

    if winning_player == "X" || winning_player == "O"
      winning_player
    else
      nil
    end

  end


  def turn

    current_player_turn = self.current_player
    position = current_player_turn.move(@board)
    if @board.valid_move?(position)
      position
    else
      current_player_turn.move(@board)
    end
    @board.update(position, current_player)

  end


  def play

    self.turn
    self.over?
    if self.won?
      puts "Congratulations #{self.winner}!"
    end

    if self.draw?
      puts "Cat's Game!"
    end

  end




end
