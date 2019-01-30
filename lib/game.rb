require 'pry'
class Game
  
    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]]
      
    attr_accessor :board
    attr_reader :player_1, :player_2
    
    def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
      self.player_1 = player_1
      self.player_2 = player_2
      @board = board
    end
    
    def player_1=(player_1)
      @player_1 = player_1
      @player_1.game = self
    end
    
    def player_2=(player_2)
      @player_2 = player_2
      @player_2.game = self
    end
    
    def current_player
      board.turn_count.even? ? player_1 : player_2
    end
    
    def not_current_player
      board.turn_count.odd? ? player_1 : player_2
    end
    
    def over?
      board.cells.all? { |square| !(square.nil? || square == " ")}
    end
    
    def won?
      WIN_COMBINATIONS.detect do |combo|
        combo.all? {|item| board.cells[item] == board.cells[combo.first]} && (board.cells[combo.first] == 'X' || board.cells[combo.first] == 'O')
      end
    end
    
    def win_combos 
      WIN_COMBINATIONS
    end
    
    def draw?
      over? && !won?
    end
    
    def winner
      won? ? board.cells[won?.first] : nil
    end
    
    def turn
      input = current_player.move(board)
    end
    
    def play
      until won? || draw?
        turn
      end
      board.display
      if draw?
        puts ''
        puts "Cat's Game!"
      else
        puts ''
        puts "Congratulations #{winner}!"
      end
    end 
    
    def self.greet
      puts ''
      puts "How about a nice game of Tic-Tac-Toe?"
    end
    
    def self.setup
      mode = ''
      until %w(0 1 2 q).include?(mode)
        puts '-' * 45
        puts "<0> Computer 1 vs Computer 2"
        puts "<1> Human 1 vs Computer 1"
        puts "<2> Human 1 vs Human 2"
        puts "<q> Quitting humans"
        puts '-' * 45
        mode = gets.chomp
      end
      

      case mode
        when '0', 'q'
          players = { player_1: {species: 'Computer'}, player_2:{species: 'Computer' }}
          
        when '1'
          players = { player_1: {species: 'Human'}, player_2:{species: 'Computer' }}
          
        when '2'
          players = { player_1: {species: 'Human'}, player_2:{species: 'Human' }}
      end 
      
      player_x = ''

      until %w(1 2 q).include?(player_x) || mode == 'q'
        puts ''
        puts "Which player will choose 'x' and strike first"
        puts '-' * 45
        puts "<1> Player 1 - #{players[:player_1][:species]}"
        puts "<2> Player 2 - #{players[:player_2][:species]}"
        puts "<q> Quit"
        puts '-' * 45
        player_x = gets.chomp
      end
      
      if mode != 'q'
        if player_x == '1'
          players[:player_1][:player] = Object.const_get("Players::#{players[:player_1][:species]}").new('X')
          players[:player_2][:player] = Object.const_get("Players::#{players[:player_2][:species]}").new('O')
        else
          players[:player_1][:player] = Object.const_get("Players::#{players[:player_1][:species]}").new('O')
          players[:player_2][:player] = Object.const_get("Players::#{players[:player_2][:species]}").new('X')
        end
        self.new(players[:player_1][:player], players[:player_2][:player], Board.new)
      end
    end
end