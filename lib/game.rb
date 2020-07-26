class Game 
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
      ]
    
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
    
  def current_player
    self.board.turn_count.even? == true ? self.player_1 : self.player_2
  end
    
  def won?
    winner = nil
    WIN_COMBINATIONS.each do |combination|
      if combination.all? {|token| self.board.cells[token] == "X"}
        winner = combination
      elsif combination.all? {|token| self.board.cells[token] == "O"}
        winner = combination
      else
        false
      end
    end
      winner != nil ? winner : false
  end
  
  def draw?
    won? == false && full? == true ? true : false
  end
    
  def full?
    self.board.cells.none?{|token| token == " "} 
  end
    
  def over?
    won? || draw? || full? ? true : false
  end
    
  def winner
    winner = nil
    WIN_COMBINATIONS.each do |combination|
      if combination.all? {|token| self.board.cells[token] == "X"}
        winner = "X"
      elsif combination.all? {|token| self.board.cells[token] == "O"}
        winner = "O"
      end 
    end
    winner
  end

  def turn(board = nil)
    input = self.current_player.move(board)
    if self.board.valid_move?(input) == false || self.board.taken?(input) == true 
      input = self.current_player.move(board)
    else
      self.board.update(input, self.current_player)
      self.board.display
      self.current_player
    end
  end
   
  def play
    while !over?
      self.turn(board)
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
  def self.start 
    puts "Get ready to practice the dark art of Tic-Tac-Toe!"
    puts "Wanna play with 0, 1, or 2 human players?"
    input = ' ' 
    input = gets.strip.to_i 
    #case input 
      #when input != 0 || 1 || 2 
       # puts "Try that again: 0, 1, or 2 players?"
     
     
      if input == 0 
        game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
        game.play

        
       # input_2 = gets.strip
        #if input_2.exclude?("1") == true || input_2.exclude?("2") 
         # puts "Give it another go: '1' or '2'?"
        #else 
         # Game.new()
      elsif input == 1 
        puts "Who gets to be 'X' and go first-- 'human' or 'computer'?"
        input_3 = gets.strip
        if input_3 == 'human'
            game = self.new(Players::Human.new("X"), Players::Computer.new("O"), board = Board.new)
            game.play
        elsif input_3 == 'computer'
            game = self.new(Players::Computer.new("X"), Players::Human.new("O"), board = Board.new)
             game.play 
        end

      elsif input == 2 
        puts "Who gets to be 'X' and go first--'1' or '2'?"
        input_4 = gets.strip.to_i
          if input_4 == 1 
            game = self.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
            game.play
          elsif input_4 == 2 
            game = self.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
            game.play
          end
        end

      end
    end
    

