require 'pry'
class Game
    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

    attr_accessor :board, :player_1, :player_2

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @board = board
      @player_1 = player_1
      @player_2 = player_2
    end

    def current_player
      @board.turn_count.even? ? @player_1 : @player_2
    end

    def over?
      draw? || won?
    end

    def won?
      WIN_COMBINATIONS.each do |combo|
        #binding.pry
        result = []
        combo.each { |index| result << @board.cells[index] }
        result
        if result.all?{ |space| space == "X" } || result.all?{ |space|  space == "O"}
            return combo
        end
      end
      return false
    end

    def draw?
      !won? && @board.full?
    end

    def winner
      if won?
        winner_check
      else
        nil
      end
    end

    def winner_check
      answer = []
      WIN_COMBINATIONS.each do |combo|
        result = []
        combo.each { |j| result << @board.cells[j] }
        answer << result
        break if xwin?(result) || owin?(result)
      end
      answer.last[0]
    end

    def xwin?(array)
      array.all? { |d| d == "X"}
    end

    def owin?(array)
      array.all? { |d| d == "O"}
    end

    def turn
      input = current_player.move(@board).to_s
      if @board.valid_move?(input)
        @board.update(input,current_player)
        @board.display
      elsif input.downcase == "exit"
        exit
      else
        turn
      end

    end

    def play
      until over?
        turn
      end
      if won?
        puts "Congratulations #{winner_name}!"
        return 1
      else
         puts "Cat's Game!"
         return 0
      end
    end

    def winner_name
      winner == "X" ? "X" : "O"
    end

  end
