class Game
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
   attr_accessor :board, :player_1, :player_2
   def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  def current_player
     if @board.turn_count % 2 == 0
       return @player_1
     else
       return @player_2
     end
  end

  def won?
    cells = @board.cells
    WIN_COMBINATIONS.each do |combination|
      element_1 = cells[combination[0]]
      element_2 = cells[combination[1]]
      element_3 = cells[combination[2]]

      x_wins = element_1 == "X" && element_2 == "X" && element_3 == "X"
      y_wins = element_1 == "O" && element_2 == "O" && element_3 == "O"
      if x_wins || y_wins
        return combination
      end
    end
    false
  end






end
