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
  [6, 4, 2]
  ]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    if board.turn_count.even?
      @@next_player = @player_2
      @player_1
    else
      @@next_player = @player_1
      @player_2
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.taken?(combo[0] + 1)
    end
  end
  
    def draw?
    if board.full? && !won?
      return true
    else
      return false
    end
  end
  
  def over?
    return true if draw? || won?
  end
  
  
  def winner
    hold_array = []
    WIN_COMBINATIONS.each do |combo|
      combo.each do |index|
        hold_array << board.cells[index] unless board.cells[index] == " "
      end
      if hold_array.length == 3 && hold_array.uniq.length == 1
        return hold_array.uniq.first
      else
        hold_array.clear
      end
    end
    nil
  end
  
  def turn
    input = self.current_player.move(board)
     if !board.valid_move?(input)
       system "clear"
       puts "*~*~*~*~*~*~*~*~*~*~*"
       puts "INVALID MOVE, BUDDY!"
       puts "*~*~*~*~*~*~*~*~*~*~*"
       sleep(2)
       system "clear"
       turn
    else
      board.update(input, current_player)
      board.turn_count
      system "clear"
    end
  end
  
  def play
    until over?
      turn
    end
    
    if won?
      system "clear"
      puts "Congratulations #{winner}!"
      board.display
      sleep(2)
      system ("clear")
      puts "Play again? (type 'y' or 'n')"
      input = gets.chomp
      if input == 'y'
        load './bin/tictactoe.rb'
      else
        system("clear")
        puts "Ta Ta!"
      end
    elsif draw?
      system "clear"
      puts "Cat's Game!"
      sleep(2)
      system ("clear")
      puts "Play again? (type 'y' or 'n')"
      input = gets.chomp
      if input == 'y'
        load './bin/tictactoe.rb'
      else
        system("clear")
        puts "Ta Ta!"
      end
    end
  end
  
  def wargame
    count = 0
    until count == 100
      input = self.current_player.move(board)
      board.update(input, current_player)
      board.turn_count
    end
    
    if won?
      count += 1
      system "clear"
      puts "Congratulations #{winner}!"
      board.display
    end
  end
end