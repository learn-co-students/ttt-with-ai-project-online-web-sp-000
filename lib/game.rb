require_relative './players/human.rb'


class Game
 include Players
 
  attr_accessor :token, :player_1, :player_2, :human, :board, :input

  WIN_COMBINATIONS = [
    [0, 1, 2], #top row
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 4, 8], #left diagonal
    [2, 4, 6], #right diagonal
    [0, 3, 6], #left column
    [1, 4, 7], #middle column
    [2, 5, 8]  #right column
    ]

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def input
    @input = self.current_player.input
  end
  
  def current_player
    board_instance = self.board
    if board_instance.turn_count % 2 == 0
      @player_1
    else
      @player_2
    end
  end
  
  def won?
    #return false for a draw. a draw is when no winning combo have all of one character and the board is full
    winning_array =[ ]
    WIN_COMBINATIONS.each do |combo|
      if self.board.cells[combo[0]] == "X" && self.board.cells[combo[1]] == "X" && self.board.cells[combo[2]] == "X"
       winning_array = combo
      elsif self.board.cells[combo[0]] == "O" && self.board.cells[combo[1]] == "O" && self.board.cells[combo[2]] == "O"
       winning_array = combo
     end
   end

     #returning false for a draw. if the board is full and there is no winning array (winning_array = []) => false
     if self.board.full? == true && winning_array == [ ]
      #setting winning_array  equal to false since that is the last variable i want to return or this method 
       winning_array = false
     end
    winning_array
  end
  
  def draw?
    #a draw occurs if the board is full and there is no winner.
    if self.board.full? == true && self.won? == false
      true
    end
  end
  
  def over?
    #a game is over if there is a draw
    if self.draw? == true
      true
    #or if the game has been won.
    elsif WIN_COMBINATIONS.include?(self.won?)
      true
    #otherwise, it's in progress
    else
      false
    end
  end
  
  def winner
    #using #won? to find the winning array to find the character
    winner_character = self.won?
    if winner_character == []
      nil
    else
      #using the first element of the winning array to retrieve the character from the board
      self.board.cells[winner_character[0]]
    end
   end

  def turn
    #p self.current_player.input
    position_to_play = self.current_player.move(input)
    valid = self.board.valid_move?(position_to_play)
    if valid == true
      self.board.update(input, self.current_player)
      self.board.display
      
      if current_player == @player_1
        current_player = @player_2
        puts "Player 2, it is now your turn."
      else
        current_player = @player_1
        puts "Player 1, it is now your turn."
      end
    elsif valid == false
      puts "That space has been taken, please pick a different number."
      self.current_player.move(input)
    end
  end

  
  def play
    count = 0
    until self.over? == true
      self.turn
    end
    
    if self.draw? == true
      puts "Cat's Game!"
      ##I MAY NEED TO CHANGE THE LOGIC HERE. SWITCH IT SO THAT ONE CHARACTER IS EQUAL TO A WINNING COMBINATION.
    elsif self.won? != false
      puts "Congratulations #{self.winner}!"
    end
  end
  
  

end
  