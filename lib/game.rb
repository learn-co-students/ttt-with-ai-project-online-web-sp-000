class Game 


    attr_accessor :board, :player_1, :player_2
    WIN_COMBINATIONS = [
  [0,1,2], 
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [6,4,2],
  [0,4,8]  
]

def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
end

def current_player
    if @board.turn_count % 2 == 0
        player_1
      else 
        player_2 
    end
 end

 def won?
    WIN_COMBINATIONS.each do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]
  position_1 = board.cells[win_index_1] # load the value of the board at win_index_1
  position_2 = board.cells[win_index_2] # load the value of the board at win_index_2
  position_3 = board.cells[win_index_3] # load the value of the board at win_index_3
  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination # return the win_combination indexes that won.
  end
  if position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination # return the win_combination indexes that won.
end
end
false
end

def draw?
    if !won? && board.full?
      #binding.pry
      return true
    elsif !board.full? && !won?
      return false
    else won?
      return false
    end
  end

  def over?
    if draw? || won? || board.full?
      return true
    else
      return false
    end
  end

  def winner
    if win_combo = won?
      @winner = @board.cells[win_combo.first]
    end
  end

    def turn
        player = current_player
        current_move = player.move(@board)
        if !@board.valid_move?(current_move)
          turn
        else
          puts "Turn: #{@board.turn_count + 1}"
          @board.display
          @board.update(current_move, player)
          puts "#{player.token} moved #{current_move}"
          @board.display
          puts "\n"
        end
      end

      def play
        until over?
          turn 
        end
        if won?
          winner == "X" || winner == "O"
          puts "Congratulations #{winner}!"
        else draw?
          puts "Cat\'s Game!"
        end
      end
    end

    