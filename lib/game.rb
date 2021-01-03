require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2, :current_player

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]


  def board
    @board
  end


  def player_1
    @player_1
  end


  def player_2
    @player_2
  end


  def initialize(player_1 = nil, player_2 = nil, board = nil)
    @player_1 = player_1 || Players::Human.new("X")
    @player_2 = player_2 || Players::Human.new("O")
    @board    = board || Board.new
    @current_player = @player_1
  end


  def current_player?
    @board.turn_count.odd? ? @player1 : @player_2
  end


  def won?
    WIN_COMBINATIONS.find do |combo|
      board_cells = []
      combo.each {|cell| board_cells << @board.cells[cell]}
      # binding.pry
      if board_cells.all?("X") || board_cells.all?("O")
        combo
      else
        false
      end
    end
  end


  def draw?
    @board.full? && !self.won?
  end


  def over?
    self.won? || self.draw?
  end


  def winner
    self.won? ? @board.cells[self.won?[0]] : nil
  end


  def next_player
    if @current_player == @player_1
      @current_player = @player_2
    elsif @current_player == @player_2
      @current_player = @player_1
    end
    @current_player
  end


  def turn
    player_input = @current_player.move(@board)

    if @board.valid_move?(player_input)
      @board.update(player_input, @current_player)
      self.next_player
      @board.display
    else
      puts "Invalid move, please try again."
      turn
    end
  end


  def play
    while !self.over?
      self.turn
    end

    if self.draw?
      puts "Cat's Game!"
    elsif self.won?
      puts "Congratulations #{winner}!"
    end
  end
end
