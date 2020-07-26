class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def self.all_computer_game
    self.new(Players::Computer.new("X"), Players::Computer.new("O"))
  end

  def self.computer_first_game
    self.new(Players::Computer.new("X"))
  end

  def self.computer_second_game
    self.new(Players::Human.new("X"), Players::Computer.new("O"))
  end

  def current_player
    @board.turn_count.odd? ? player_2 : player_1
  end

  def won?
    winning_array = false
    WIN_COMBINATIONS.each do |win_condition|
      if win_condition.all?{|index| board.cells[index] == "X"} || win_condition.all?{|index| board.cells[index] == "O"}
        winning_array = win_condition
      end
    end
    winning_array
  end

  def draw?
    board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    won? ? board.cells[won?[0]] : nil
  end

  def turn
    cell = current_player.move(@board)
    if !@board.valid_move?(cell)
      current_player.move(@board)
    else
      @board.update(cell, current_player)
    end
    @board.display
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
