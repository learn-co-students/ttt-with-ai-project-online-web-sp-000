require 'pry'

# The Game class is the main model of the application and
# represents a singular instance of a Tic-tac-toe session

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
    [2,4,6]
  ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    if player_1
      player_1
    elsif player_2
      player_2
    end
  end
  
  def won?
    WIN_COMBINATIONS.find do |win_combination|
      board.cells[win_combination[0]] == board.cells[win_combination[1]] && board.cells[win_combination[1]] == board.cells[win_combination[2]] && board.taken?(win_combination[0])
    end
  end

  def draw?
    !won? && board.full?
  end

  def over?
    won? || draw? || board.full?
  end
  
  def winner
    if won?
      board.cells[won?[0]]
    end
  end
  
  
  def turn
    #puts "Please enter 1-9:"
    #index = input_to_index(user_input)
    if board.valid_move?
      board.cells[position] = current_player

      binding.pry
      #move(index, character = current_player)
      #display_board
    # else
    #   turn
    end
  end

  def play
    current_player
    round = 0
    until round == 9 || over?
      round += 1
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end