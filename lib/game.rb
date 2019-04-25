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
  
  # def won?

  #   hold_array = []
  
  #   WIN_COMBINATIONS.each do |combo|
  #     combo.each do |index|
  #       hold_array << board.cells[index] if board.taken?(index)
  #       end
  #     if hold_array.length == 3 && hold_array.uniq.length == 1
  #       return combo
  #     else
  #       hold_array.clear
  #     end
  #   end
  #   false
  # end
  
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
      # binding.pry
      turn
    else
      board.update(input, current_player)
      board.turn_count
    end
  end
  
  def play
    # binding.pry
    until over?
    # binding.pry
      turn
    end
    
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end