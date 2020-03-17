class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], #across
  [0,3,6], [1,4,7], [2,5,8], #down
  [0,4,8], [2,4,6]] #diagonal

  def initialize(p1 = nil, p2 = nil, board = nil)
    @player_1 = Players::Human.new("X") unless @player_1 = p1
    @player_2 = Players::Human.new("O") unless @player_2 = p2
    @board = Board.new unless @board = board
  end

  def current_player
    x_count, o_count = 0, 0
    @board.cells.each do |element|
      element == "X" ? x_count = x_count + 1 : element == "O" ? o_count = o_count + 1 : nil
    end
    x_count > o_count ? @player_2 : @player_1
  end

  def won?
    x_positions, o_positions, x_wins, o_wins = [],[], [], []

    @board.cells.each_with_index do |cell, i|
      cell == "X" ? x_positions << i : cell == "O" ? o_positions << i : nil
    end

    WIN_COMBINATIONS.each do |combo|
      (combo - x_positions) == [] ? (x_wins = combo) : (combo - o_positions) == [] ? o_wins = combo : nil
    end
    x_wins.length > 0 ? x_wins : o_wins.length > 0 ? o_wins : false
  end

  def draw?
    !won? && @board.cells.select{|cell| cell != " "}
  end

  def over?
    (won? || draw?) ? return true : nil

  end

end
