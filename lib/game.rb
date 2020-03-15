require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2, :timer

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
      puts "Please enter 1-9:"
      input = self.current_player.move(input)
      while board.valid_move?(input) == false do
         puts "Please enter 1-9:"
         input = self.current_player.move(input)
         board.valid_move?(input)
      end
       board.update(input, self.current_player)
       puts self.board
    end

    def play
      board.reset!
      until over? do
        turn
        puts board
      end
      if draw?
        puts "Cat's Game!"
      else
        puts "Congratulations #{winner}!"
      end
    end
    def wargames
      @couner = 0
      x = 0
      o = 0
      draw = 0
      until @counter = 100
        @counter += 1
        player_1 = Player::Computer.new("X")
        player_2 = Player::Computer.new("O")
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
        sleep(@timer*2)
        @timer -= (@timer/3)
      end
      puts "We had #{x} wins for X and #{o} wind for O and #{draw} draws!"
      puts "A STRANGE GAME. THE ONLY WINNING MOVE IS NOT TO PLAY."
      puts "HOW ABOUT A NICE GAME OF CHESS?"
    end

    def start
      puts "Welcome to Tic Tac Toe!"
      puts "Would you like to play 0, 1, or 2 player mode?"
      input = gets.chomp.to_i
      if input == 0
        self.wargames
      elsif input == 1
        puts "Would you like to be X or O?"
        input = gets.chomp
        if input == "X"
          player_1=Player::Human.new("X")
          player_2 = Player::Computer.new("O")
          play
        elsif input == "O"
          player_1=Player::Human.new("O")
          player_2 = Player::Computer.new("X")
          play
        end
      elsif "WARGAMES!"
        self.wargames
      else
        play
      end
    end

  end
