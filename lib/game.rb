
class Game

    WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,4,8], [2,4,6],
    [0,3,6], [1,4,7], [2,5,8],
    ]

attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2=Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      index_1 = win_combo[0]
      index_2 = win_combo[1]
      index_3 = win_combo[2]
      @board.cells[index_1] == @board.cells[index_2] &&
      @board.cells[index_2] == @board.cells[index_3] &&
      @board.taken?(index_1 + 1)
      end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if win = won?
      @board.cells[win.first]
    end
  end

  def turn
    user_input = current_player.move(board)
  if @board.valid_move?(user_input)
    @board.update(user_input, current_player)
    @board.display
  else
    puts "Please enter a valid move"
    turn
    end
  end

  def play
    while !over?
      turn
      draw?
  end
  if won?
      puts "Congratulations #{winner}!"
  elsif draw?
      puts "Cat's Game!"
    end
  end

  def play_again?
    puts "Do you want to play again? (Y/N)"
    reply = gets.strip.uppercase
  if reply == "Y"
      game = Game.new
    elsif reply == "N"
      puts "Thanks for playing!"
    else
      puts "Invalid entry. Please answer with Y or N"
      self.play_again?
    end

  def start
    puts "How would you like to play?"
    puts "0 = Computer vs Computer"
    puts "1 = Player vs Computer"
    puts "2 = Player vs Player"
    puts "Please select a number (0,1,2) "

    gametype = gets.chomp

    if gametype == "1"
        puts "Do you want to go first? [Y/ N]"
        if gets.strip == "Y : y"
          Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new).play
        else   Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new).play
        end

      elsif gametype == "0"
        Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new).play

      elsif gametype == "2"
        Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new).play

      play_again?
      end
    end
  end
end
