require_relative "../lib/players/human.rb"
require_relative "../lib/players/computer.rb"
class Game

  attr_accessor :board, :player_1, :player_2

  	WIN_COMBINATIONS = [
                      #horizontal rows
                      [0, 1, 2],
                      [3, 4, 5],
                      [6, 7, 8],

                      #vertical columns
                      [0, 3, 6],
                      [1, 4, 7],
                      [2, 5, 8],

                      #diagonals
                      [0, 4, 8],
                      [2, 4, 6]

                  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  	#binding.pry
    @player_1 = player_1
  	@player_2 = player_2
  	@board = board
  end

  def current_player
    #binding.pry
    board.turn_count == 0 || board.turn_count.even? ? @player_1 : @player_2
  end

  def won?
    @win_array = []
    # if draw?
    #   return false
    # end

    WIN_COMBINATIONS.each do |win_combination|

    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board.cells[win_index_1] # load the value of the board at win_index_1
    position_2 = board.cells[win_index_2] # load the value of the board at win_index_2
    position_3 = board.cells[win_index_3] # load the value of the board at win_index_3
    #binding.pry
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      #@win_token = position_1
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
       #@win_token = position_1
      return win_combination # return the win_combination indexes that won.
    end
  end
  return false
  #end
end

  def draw?
    !board.cells.include?(" ") && !won? ? true : false
  end

  def over?
    draw? || won? ? true : false
  end

  def winner
    won? ? board.cells[won?[0]] : nil
  end

  def turn
    #binding.pry
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
      board.turn_count
      current_player
    else
      turn
    end
  end

  def play
    while !over?
      turn
      board.display
    end

    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
  end
end

  
 