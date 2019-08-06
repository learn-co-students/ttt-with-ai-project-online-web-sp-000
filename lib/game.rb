class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(p1 = Players::Human.new("X"), p2 = Players::Human.new("O"), board = Board.new)
    @player_1 = p1
    @player_2 = p2
    @board = board
  end # of initialze

  def board
    @board
  end

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]

  def won?
    WIN_COMBINATIONS.each do | win_combination |

      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = self.board.cells[win_index_1]
      position_2 = self.board.cells[win_index_2]
      position_3 = self.board.cells[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      end
      if position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    false
  end

  def current_player()
    if @board.turn_count % 2 == 0
      @player_1
    else
      @player_2
    end
  end # of current player

  def turn
    input = current_player.move(@board)
    if @board.valid_move?(input)
      puts "valid move"
      @board.update(input, current_player)
      @board.display
    else
      turn
    end
  @board.turn_count
    # if @board.valid_move?(index)
    #   Players::human.move(index, current_player)
    #   @board.display_board
    # else
    #   puts "Hmm, that was not valid. Try again"
    # end
  end # of turn



  def draw?
    @board.full? && !won? ? true : false
  end #of draw

  # def over?
  #   won? || draw? || @board.full? ? true : false
  #   @board.full? && !@board.won? ? true : false
  # end #of draw

  def over?
    won? || draw? || @board.full? ? true : false
  end # fo over

  def winner
    won? ? @board.cells[won?[0]] : nil
  end #of winner

  def play

    until over?
      puts "Please make your move"
      self.turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end #of play

end #of class
