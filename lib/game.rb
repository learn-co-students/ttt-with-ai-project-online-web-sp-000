require 'pry'

class Game
  attr_accessor :player_1, :player_2, :token, :board
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize(player_1 = nil, player_2 = nil, board = nil)
      if(player_1)
        @player_1 = player_1
      else
        @player_1 = Players::Human.new('X')
      end

      if(player_2)
        @player_2 = player_2
      else
        @player_2 = Players::Human.new('O')
      end

      if(board)
        @board = board
      else
        @board = Board.new
      end
  end

  def board
    @board
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def won?
      WIN_COMBINATIONS.any? do |wc|
      if (@board.taken?(wc[0] + 1) && @board.cells[wc[0]] == @board.cells[wc[1]] && @board.cells[wc[1]] == @board.cells[wc[2]])
        #@winner_token = @board.cells[wc[0]]
        return wc
      end
      if !wc
        return false
      end
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
      if won?
        @board.cells[won?[0]]  #just returns at the index of a winning combo on the board array
      elsif draw?
        nil
      end
  end

  def turn
    puts "Hi"
    @board.display #display the board
    attempted_move = self.current_player.move(@board) #assign the attempted move to the current player

    if @board.valid_move?(attempted_move)
      @board.update(attempted_move, self.current_player)
    else
      turn #run through THIS method (not board's turn method) again if not a valid move
    end
    @board.display #display board again to indicate the updated move
  end

  def play
    turn until over?

    if over?
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end
  end

end
