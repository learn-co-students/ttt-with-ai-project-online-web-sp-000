require 'pry'
class Game
  
  attr_accessor :board, :player_1, :player_2

  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  WIN_COMBINATIONS =  [
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
    if board.turn_count.even?
      player_1
    else
      player_2
    end
  end
  
 def won?
    WIN_COMBINATIONS.detect do |win_combination|
      board.cells[win_combination[0]] == board.cells[win_combination[1]] && 
      board.cells[win_combination[1]] == board.cells[win_combination[2]] && board.taken?(win_combination[2]+ 1) 
    # revisit and try to understand logic
    end
  end
  
  def draw?
    if !won? && board.full?
      true
    end
  end
  
  def over?
    draw? || won?
    # if draw?
    #   true
    # elsif won?
    #   true
    # else
    #   false
    # end
  end
  
  def winner
    if won?
      win_combination = won?
      board.cells[win_combination[0]]
    else
    end
  end
  
  def turn
    player = current_player
    current_move = player.move(board)
    if !board.valid_move?(current_move)
      turn
    else
      board.update(current_move, player)
      board.display
    end
  end
  
  def play 
    until over? do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
  def start 
    puts "welcome to Tic Tac Toe"
    puts "How many players, 0, 1, or 2?"
    puts "Which player will go first?"
    input = gets
    new_game = self.new(input)
  end
  
end