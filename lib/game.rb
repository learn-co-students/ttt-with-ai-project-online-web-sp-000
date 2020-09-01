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
    [2,4,6]]
  
  def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    board.turn_count.even? ? player_1 : player_2
  end
  
  def won?
    
    WIN_COMBINATIONS.each do |win_array|
    position_1 = board.cells[win_array[0]]
    position_2 = board.cells[win_array[1]]
    position_3 = board.cells[win_array[2]]
    check_array = [position_1, position_2, position_3]
  
      if check_array[0] == check_array[1] && check_array[0] == check_array[2] && check_array[0] != " "
        return win_array
      end
    end
    false
  end

  def draw?
    board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    board.cells[won?[0]] if won?
  end

  def turn
    puts "Where would you like to move? Type in a number 1-9."
    input = current_player.move(board)

    board.valid_move?(input) ? board.update(input, current_player) : turn
    board.display
  end
  
  def set_player_1
    puts "Who will be Player 1 (Xs)? Enter '1' for human or '2' for computer"
    input = gets.strip

    case input
      when "1"
        self.player_1 = Players::Human.new("X")
      when "2"
        self.player_1 = Players::Computer.new("X")
      else
        set_player_1
    end
  end
  
  def set_player_2
    puts "Who will be Player 2 (Os)? Enter '1' for human or '2' for computer"
    input = gets.strip

    case input
      when "1"
        self.player_2 = Players::Human.new("O")
      when "2"
        self.player_2 = Players::Computer.new("O")
      else
        set_player_2
    end
  end
  
  def play_again?
    puts "Would you like to play again? Enter '1' to play again or '2' to exit"
    input = gets.strip
    
    case input
      when "1"
        board.reset!
        play
      when "2"
        puts "Goodbye!"
      else
        play_again?
    end
  end
  
  def play
    
    puts "Welcome to Tic-Tak-Toe v.3.2!"
    set_player_1
    set_player_2
    board.display
    
    turn until over?
    
    if won?
      puts "Congratulations #{winner}!"
    else 
      puts "Cat's Game!"
    end
    
    play_again?
  
  end

end