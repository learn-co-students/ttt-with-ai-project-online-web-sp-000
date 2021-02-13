require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  def initialize(player_1=Players::Human.new(token="X"), player_2=Players::Human.new(token="O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if board.turn_count%2==0
      player_1
    else
      player_2
    end
  end

  def won?
    #for every winner, assign element of winner to variable
    WIN_COMBINATIONS.each do |win_combo|
      index_0 = win_combo[0]
      index_1 = win_combo[1]
      index_2 = win_combo[2]
    #use those variables to search board
      position_1 = board.cells[index_0]
      position_2 = board.cells[index_1]
      position_3 = board.cells[index_2]
    #see if all are "X" or "O"
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combo
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combo
      end
    end
    false            #otherwise false
  end

#  alternate won? logic:
#    WIN_COMBINATIONS.detect do |combo|
#      @board.cells[combo[0]] == @board.cells[combo[1]] &&
#      @board.cells[combo[1]] == @board.cells[combo[2]] &&
#      @board.taken?(combo[0]+1)
#    end


  def draw?
    board.full? && !won? #? true : false #remember ?: for cleaner code!
  end

  def over?
    won? || draw? #? true : false
  end

  def winner
    #won? returns an array which represents a subset of board.cells
    won? ? board.cells[won?[0]] : nil
    #returns "X" or "O"
  end

  def turn
    puts "Please choose a number 1-9:"
#  current Player gets input in Players::Human.move
    user_input = current_player.move(board)
#    if input is valid, update board, else ask for new input
    if board.valid_move?(user_input)
      board.update(user_input, current_player)
    else
      puts "Choose a number not already taken"
      turn
    end
    board.display
    puts "\n\n"
    sleep 1

  end

  def play
    turn until over?

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
