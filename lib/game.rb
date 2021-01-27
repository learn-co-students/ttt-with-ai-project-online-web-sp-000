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
    [2, 4, 6]
    ]
    
    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @board = board 
      @player_1 = player_1
      @player_2 = player_2 
    end 
    
    def current_player
      if self.board.turn_count.even?
        self.player_1
      else 
        self.player_2
      end 
    end 
    
    def won?
      WIN_COMBINATIONS.each do |combo|
        win_index_1 = combo[0]
        win_index_2 = combo[1]
        win_index_3 = combo[2]
        
        position_1 = self.board.cells[win_index_1]
        position_2 = self.board.cells[win_index_2]
        position_3 = self.board.cells[win_index_3]
        
        
      if position_1 == position_2 && position_2 == position_3 && position_1 != " "
          return combo
        end
      end
      return false 
    end
    
    
    def draw?
      if self.board.full? && !self.won?
        return true 
      else
        return false 
      end 
    end 
    
    def over?
      if self.won? || self.draw? || self.board.full?  
        return true 
      else
        return false
      end 
    end 
    
    def winner
      if self.won?
        self.board.cells[won?[0]] unless self.board.cells[won?[0]] == " "
      end 
    end 
    
    def turn
      move = self.current_player.move(self.board)
      if self.board.valid_move?(move)
        self.board.update(move, self.current_player)
        self.board.display
      else
        puts "Invalid move."
        self.turn 
      end 
    end 
    
    def play
      until self.over?
        self.turn
      end 
      if self.won?
        puts "Congratulations #{winner}!"
      elsif self.draw?
        puts "Cat's Game!"
      end
    end
    
    def self.start 
      puts "Welcome to Tic-Tac-Toe!"
      puts "How many players?" 
      number_of_players = gets.strip
      if number_of_players == "0"
        game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
        game.play
      end 
      if number_of_players == "1"
        puts "X or O?"
        player = gets.strip
        if player == "X"
          game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
          game.play 
          elsif player == "O"
          game = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
          game.play 
        end 
      end
      if number_of_players == "2"
        game = Game.new
        game.play 
      end
      puts "To play again, type 'play again' otherwise type 'exit'."
      input = gets.strip 
      if input == "play again"
        self.start
      end 
    end 

    
        

end 