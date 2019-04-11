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
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    if @board.turn_count.even?
      @player_1
    else
      @player_2
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |winning_combination|
      index1 = winning_combination[0]
      index2 = winning_combination[1]
      index3 = winning_combination[2]
      
      if (@board.cells[index1] == "X" && @board.cells[index2] == "X" && @board.cells[index3] == "X") || (@board.cells[index1] == "O" && @board.cells[index2] == "O" && @board.cells[index3] == "O")
        return winning_combination
      end
    end
    #***return false after it iterates through all of winning combinations and doesn't return winning combination
    false
  end
  
  def draw?
    if @board.full? && !won?
      true
    else
      false
    end
  end
  
  def over?
    if draw? || won?
      true
    end
  end
  
  def winner
    #if not won return nil and exit out of method
    if !won?
      return nil
    end
    
    winning_combination = won?
    index1 = winning_combination[0]
    
    if @board.cells[index1] == @player_1.token
      @player_1.token
    else
      @player_2.token
    end
  end
  
  def turn
    #make move depending on whose turn
    if @board.turn_count.even?
      input = @player_1.move(@board) #=>*********uses Players::Human#move to ask for user input for that player
      
      #uses the Player class to receive input instead of simply asking for input
      
      #this allows computer versus human interaction; where if computer is one of player, computer player class will return an input
      
      #so Players::Compuer#move will return an (random or artificial intelligence) input and Game #turn will automatically make move, whereas Players::Human#move asks for user input and Game #turn will make move.*****
      
      #validate user input
      while !@board.valid_move?(input)
        puts "Invalid input! Try again."
        input = @player_1.move(@board)
      end
      
      @board.update(input, @player_1)
    else
      input = @player_2.move(@board)
      
      while !@board.valid_move?(input)
        input = @player_2.move(@board)
      end
      
      @board.update(input, @player_2)
    end
  end
  
  def play

    #keep playing until over
    until over?
      @board.display
      turn
    end
    
      @board.display
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end

    
  end
end