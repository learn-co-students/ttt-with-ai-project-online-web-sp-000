class Game
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    current_turn = board.cells.count{ |cell| cell == " "} - 1
    current_turn % 2 == 0 ? player_1 : player_2
  end

  def won?()
    WIN_COMBINATIONS.each do |win_combo|
      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]

      position_1 = board.cells[win_index_1]
      position_2 = board.cells[win_index_2]
      position_3 = board.cells[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
         return win_combo
       elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combo
        else
      end
    end
    false
  end

  def full?
    if board.cells.any? {|index| index == " "}
    elsif won? == false
       true
    end
  end

  def draw?
    if full? && won? == false
      true
    end
  end

  def over?
    draw? || won?
  end

  def winner
    winner = won?
    if winner
      win_index_1 = winner[0]
      position_1 = board.cells[win_index_1]
      position_1
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
      board.display
    else
      board.display
      turn
    end
  end

  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end