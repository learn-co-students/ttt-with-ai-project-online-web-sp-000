class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

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
    x_positions, o_positions, x_wins, o_wins = win_refactor.values
    x_wins.length > 0 ? x_wins : o_wins.length > 0 ? o_wins : false
  end

  def win_refactor
    x_positions, o_positions, x_wins, o_wins = [],[], [], []

    @board.cells.each_with_index do |cell, i|
      cell == "X" ? x_positions << i : cell == "O" ? o_positions << i : nil
    end

    WIN_COMBINATIONS.each do |combo|
      (combo - x_positions) == [] ? (x_wins = combo) : (combo - o_positions) == [] ? o_wins = combo : nil
    end

    {x_positions: x_positions, o_positions: o_positions, x_wins: x_wins, o_wins: o_wins}
  end

  def draw?
    !won? && @board.full?
  end

  def over?
    won? ? true : draw? ? true : false
  end

  def winner
    x_positions, o_positions, x_wins, o_wins = win_refactor.values
    x_wins.length > 0 ? "X" : o_wins.length > 0 ? "O" : nil
  end

  def turn
    position = current_player.move(@board)
    @board.valid_move?(position) ? @board.update(position, current_player) : turn
  end

  def play
    puts "Welcome to Tic Tac Toe!"
    puts "Please choose the number of players."
    puts "Enter 0, 1, or 2."
    #players = gets
    #puts "You have chosen #{players} players."
    while !over?
      turn
    end

    (winner == "X") ? (puts "Congratulations X!") : (winner == "O") ? (puts "Congratulations O!") : (puts "Cat's Game!")
    #over? ? true :
    #turn
    #over? ? over? : turn
  end

end
