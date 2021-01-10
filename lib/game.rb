class Game
  attr_accessor :player_1, :player_2, :board
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 3, 6]
  ]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def start
    puts "Tic-Tac-Toe"
    puts "Please enter number of players 0-2: "
    number_of_players = gets.strip.to_i
    
    if number_of_players == 0
      Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new).play
    elsif number_of_players == 1
      Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new).play
    elsif number_of_players == 2
      Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new).play
    else
      puts "Invalid number."
      start
    end
  end
  
  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end
  
  def won?
    WIN_COMBINATIONS.each do |combo|

      combo_1 = combo[0]
      combo_2 = combo[1]
      combo_3 = combo[2]

      position_1 = @board.cells[combo_1]
      position_2 = @board.cells[combo_2]
      position_3 = @board.cells[combo_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        return combo
      end          
    end
    return false
  end
  
  def draw?
    board.full? && !won?
  end
  
  def over?
    draw? || won?
  end
  
  def winner
    if won?
      winning_combo = won?
      @board.cells[winning_combo[0]]
    end
  end
  
  def turn
    player = current_player
    input = player.move(board)
    
    if @board.valid_move?(input)
      @board.update(input, player)
    else
      puts "Invalid move. Enter a number between 1-9: "
      turn
    end
  end
  
  def play
    until over?
      @board.display
      turn
    end
    
    if won?
      @board.display
      puts "Congratulations #{winner}!"
    else
      @board.display
      puts "Cat's Game!"
    end
    
    puts "Would you like to play again? Y/N: "
    play_again = gets.strip
    
    if play_again.upcase == "Y"
      start
    end
  end
end

  