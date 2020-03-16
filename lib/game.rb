require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2, :timer, :counter

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]]

    def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
      @board = board
      @player_1 = player_1
      @player_2 = player_2
    end

    def current_player
      board.turn_count % 2 == 0 ?  @player_1 : @player_2
    end

    def won?
      WIN_COMBINATIONS.each do |win_comb|
        moves = board.cells
        if [moves[win_comb[0]], moves[win_comb[1]], moves[win_comb[2]]].all? {|i| i == moves[win_comb[0]]} && board.taken?(win_comb[0] + 1)
          return win_comb
        end
      end
      false
    end

    def draw?
      board.full? && !won?
    end

    def over?
      if draw? || won?
        true
      end
    end

    def winner
      if won?
        board.cells[won?[0]]
      end
    end

    def turn
      puts "Player #{current_player.token}, please enter 1-9:"
      input = self.current_player.move(board)
      while board.valid_move?(input) == false do
         puts "C'mon Duuude! Pay attention!"
         input = current_player.move(board)
         board.valid_move?(input)
      end
       board.update(input, current_player)
       puts self.board
    end

    def play
      board.reset!
      until over? do
        turn
        board.display
      end
      if draw?
        puts "Cat's Game!"
      else
        puts "Congratulations #{winner}!"
      end
    end
    def wargames
      @counter = 0
      x = 0
      o = 0
      draw = 0
      until @counter == 100
        @counter += 1
        # binding.pry
        # player_1 = Player::Computer.new("X")
        # player_2 = Player::Computer.new("O")
        play
        if draw?
          draw +=1
          puts "DRAW!"
        elsif winner == "X"
          x += 1
          puts "X Wins!"
        elsif winner == "O"
          o += 1
          puts "O Wins!"
        end
      end
      puts "Played #{@counter} times."
      puts "We had #{x} wins for X and #{o} wins for O and #{draw} draws!"
      puts "A STRANGE GAME. THE ONLY WINNING MOVE IS NOT TO PLAY."
      puts "HOW ABOUT A NICE GAME OF CHESS?"
    end
  end
