class Game

  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = []

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

end
