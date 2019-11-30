require "pry" 

class Game 

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end 

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def current_player 
    @board.turn_count.even? ? @player_1 : @player_2
  end 

  def won?
    winning_combo = []
    WIN_COMBINATIONS.each do |combo|
      if combo.all? { |index| @board.cells[index] == "X"} || combo.all? { |index| @board.cells[index] == "O"}
        winning_combo = combo  
      end
    end
    if winning_combo.empty? 
      return false 
    else 
      return winning_combo
    end 
  end 

  def draw? 
    @board.full? && !won? ? true : false 
  end 

  def over? 
    won? || draw? ? true : false 
  end 

  def winner 
    if won? 
      @board.cells[won?[0]]
    else
      return nil 
    end 
  end 

  def turn 
    player = current_player
    move = player.move(@board)
    if @board.valid_move?(move)
      @board.update(move, player)
      puts "#{player.token} moved #{move}"
      @board.display
    else 
      turn
    end
  end 

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end 

end 