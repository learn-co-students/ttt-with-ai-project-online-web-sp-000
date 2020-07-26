<<<<<<< HEAD


=======
>>>>>>> ac5db6b2a229f98f73db06e0715fe2449f54bd96
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
    [2,4,6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.odd?? player_2 : player_1
  end

  def won?
    WIN_COMBINATIONS.find { |comb|
      board.cells[comb[0]] == board.cells[comb[1]] && board.cells[comb[1]] == board.cells[comb[2]] && board.cells[comb[0]] != " "
    }
  end

  def draw?
    !self.won? && self.board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      board.cells[won?[0]]
    else
      nil
    end
  end

  def turn
<<<<<<< HEAD
    puts "Please enter a number 1-9:"
    input = current_player.move(@board)
    if @board.valid_move?(input)
      @board.update(input, current_player)
    else
      puts "Please enter a number 1-9:"
      @board.display
      turn
    end
    @board.display
  end

  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
=======
    input = gets.strip
  end

  def play

>>>>>>> ac5db6b2a229f98f73db06e0715fe2449f54bd96
  end

end
