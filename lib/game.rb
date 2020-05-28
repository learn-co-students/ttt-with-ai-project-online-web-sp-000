require 'pry'
# require_relative './players/human.rb'
class Game
  attr_accessor :player_1, :player_2, :board
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

  def initialize(player_1=nil, player_2=nil, board=nil)
      @player_1 = player_1 == nil ? Players::Human.new("X") : player_1
      @player_2 = player_2 == nil ? Players::Human.new("O") : player_2
      @board = board == nil ? Board.new : board
      @board.display()
  end

  def current_player
    (@board.turn_count + 1) % 2 == 0 ? @player_2 : @player_1
  end
  
  def won?
    WIN_COMBINATIONS.each do |combo|
      tokens = combo.map {|position| @board.cells[position]}
      if tokens.all? {|t| t == "X"} or tokens.all? {|t| t == "O"}
        return combo
      # else
      #   next
      end
    end
    false
  end

  def draw?
    @board.full? && won? == false
  end

  def over?
    won? || draw?
  end

  def winner
    won? ? @board.cells[won?[0]] : nil
  end

  def turn
    position = current_player.move(@board)
    if @board.valid_move?(position) == true
      @board.update(position, current_player)
    else
      until @board.valid_move?(position) == true
        position = current_player.move(@board)
      end
    end
  end
  
  def play
    running = true
    while running == true
      if over?
        running = false
        if won?
          # binding.pry
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
      else
        turn
        @board.display
      end
    end
  end
  
  def self.start
    game_running = true

    while game_running
      puts "Tic Tac Toe"
      puts "Would you like a:"
      puts "  (0) player game"
      puts "  (1) player game"
      puts "  (2) player game"
      puts "  exit"
      
      answer = gets.strip
    
      if answer == "exit"
        puts "Goodbye"
        game_running = false
        break
        
      elsif answer.to_i == 0 
        puts "Zero Player Game Chosen"
        game = Game.new(
            Players::Computer.new("X"),
            Players::Computer.new("O"),
            Board.new
          )
        game.play
        
      elsif answer.to_i == 1
        puts "One Player Game Chosen"
        game = self.new(
            Players::Human.new("X"),
            Players::Computer.new("O"),
            Board.new
        )
        game.play
        
      elsif answer.to_i == 2
        puts "Two PLayer Game Chosen"
        game = self.new()
        game.play
        puts ""
      
      else
        puts "error"
      end
      
    end
  end
  
  
  
end
# binding.pry