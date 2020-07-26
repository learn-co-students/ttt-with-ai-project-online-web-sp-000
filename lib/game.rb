class Game
  WIN_COMBINATIONS = [[0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]]
  attr_accessor :board, :player_1, :player_2
  def initialize(player1 = Players::Human.new("X"), player2 = Players::Human.new("O"), board = Board.new)
    if player1
      @player_1 = player1
    end
    if player2
      @player_2 = player2
    end
    @board = []
    if board
      @board = board
    end
  end
  def current_player
    cnt = @board.turn_count
    if (cnt % 2 == 0)
      @player_1
    else
      @player_2
    end
  end
  def start
    puts "Welcome"
    play
    @board.desplay
  end
  def won?
   WIN_COMBINATIONS.each do |win_combination|
     # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
     # grab each index from the win_combination that composes a win.
     win_index_1 = win_combination[0]
     win_index_2 = win_combination[1]
     win_index_3 = win_combination[2]

     position_1 = @board.cells[win_index_1] # load the value of the board at win_index_1
     position_2 = @board.cells[win_index_2] # load the value of the board at win_index_2
     position_3 = @board.cells[win_index_3] # load the value of the board at win_index_3
     bigO = "O"
     if position_1 == "X" && position_2 == "X" && position_3 == "X"
       return win_combination # return the win_combination indexes that won.
     elsif position_1 == bigO && position_2 == bigO && position_3 == bigO
       return win_combination
     end
   end
   return false
 end
 def full?
    bigO = "O"
    @board.cells.all? {|i| i == "X" || i == bigO}
  end

  def draw?
    if self.full? && !(self.won?)
      return true
    else
      return false
    end
  end

  def over?
    if self.draw? || self.full?
      return true
    elsif self.won?
      return true
    else
      return false
    end
  end

  def winner
    array = self.won?
    if !self.won?
      nil
    else
      idx = array[0]
      @board.cells[idx]
    end
  end

  def input_to_index(input)
    input = input.to_i - 1
  end

  # def move(array, index, value = "X")
  #   idx = index
  #   input_to_index(idx)
  #   array[index] = value
  # end

  def turn
    input = current_player.move(@board)
    if !@board.valid_move?(input)
      turn
    else
      @board.update(input, current_player)
    end
    @board.display
  end


  def play
    until self.over? == true
      self.turn
    end
    if self.draw?
      puts("Cat's Game!")
    end
    str = self.winner
    if str != " "
      puts("Congratulations #{str}!")
    end
  end

end
