require 'pry'

class Game
  #extend Players::Human
  attr_accessor :board, :player_1, :player_2, :token

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

    def initialize (player_1=nil, player_2=nil, board=nil)
      @board = board || Board.new
      @player_1 = player_1
      @player_2 = player_2
    end

    def current_player
      if board.cells.count{|x| x == "O" || x == "X"}.even?
        player_1
      else
        player_2
      end
    end

    def won?
      WIN_COMBINATIONS.each do |x|
        if (@board.cells[x[0]] == @board.cells[x[1]]) and (@board.cells[x[1]] == @board.cells[x[2]])
          if (@board.cells[x[0]] == "O") or (@board.cells[x[0]] == "X")
            return x
          end
        end
      end
      false
    end

    def draw?
      board.full? and (not won?)
    end

    def over?
      won? || draw?
    end

    def winner
      #binding.pry
      if won? != false
        win_play = @board.cells[won?[0]]
      else
        win_play = nil
      end
      win_play
    end

    def turn
      board.display
      puts "Where would you like to go?"
      input = nil
      while not board.valid_move?(input)
        input = current_player.move(@board).to_i
      end
      board.update(input, current_player)
    end

    def play
      while (not over?)
        turn
      end

      if won? && winner == "X"
        puts "Congratulations X!"
        binding.pry
      elsif won? && winner == "O"
        puts "Congratulations O!"
        binding.pry
      elsif draw?
        puts "Cat's Game!"
      else
      end
    end

end
