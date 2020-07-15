class Game



  WIN_COMBINATIONS = [
    [0,1,2],  # Top row
    [3,4,5],  # Middle row (horizontal)
    [6,7,8],  # Bottom row
    [0,3,6],  # Left Column
    [1,4,7],  # Middle Column
    [2,5,8],  # Right Column
    [0,4,8],  # Diagonal 1 (negative slope)
    [2,4,6]   # Diagonal 2 (positive slope)
  ]

  attr_accessor :board, :player_1, :player_2


def initialize(p1 = Players::Human.new("X"), p2 = Players::Human.new("O"), board = Board.new)
  @board = board
  @player_1 = p1
  @player_2 = p2
  save
end


def save
  @@current_game = self
end

def self.current_game
return @@current_game
end

def current_player
  if @board.turn_count.even?
    return @player_1
  elsif @board.turn_count.odd?
    return @player_2
  end
end

def won?

  exes = @board.cells.each_index.select{ |i| board.cells[i] == "X"}
  ohs = @board.cells.each_index.select{ |i| board.cells[i] == "O"}

  experms = exes.permutation(3).to_a
  ohperms = ohs.permutation(3).to_a
  x_winning_index = WIN_COMBINATIONS.detect{ |win_combo| experms.include?(win_combo) }
  o_winning_index = WIN_COMBINATIONS.detect{ |win_combo| ohperms.include?(win_combo) }


  if (!!x_winning_index && !!o_winning_index)
    return false
  elsif x_winning_index
       return x_winning_index
  elsif o_winning_index
       return o_winning_index
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
    if board.full? || won? || draw?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      return board.cells[won?[0]]
    else
      return nil
    end
  end

  def turn
    @board.display
    input = current_player.move(@board)
    if !board.valid_move?(input)
      puts "Invalid input---input must contain an integer, 1-9, and cell must not be occupied."
      turn
    else
      board.update(input, current_player)
    end
  end

  def self.config
     puts "Welcome to Tic-Tac-Toe!"
     puts "How many people are playing? (0-2)"
     number_of_players = gets.strip
     case number_of_players
     when "2"
       puts "X goes first."
        new_game = Game.new()
      when "1"
        puts "Would you like to be X or O?"
        token_human = gets.strip.upcase
        token_comp = nil
        if token_human == "X"
          token_comp == "O"
        else
          token_comp == "X"
        end

       puts "Who should go first? (1: yourself, 2: computer)"
       first = gets.strip
       if first == "1"
         new_game = Game.new(Players::Human.new(token_human), Players::Computer.new(token_comp), Board.new)
       elsif first == "2"
         new_game = Game.new(Players::Computer.new(token_comp), Players::Human.new(token_human), Board.new)
     end
     when "0"
        new_game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
   end
     new_game.play
  end

  def play
    while ((board.turn_count < 9) && (self.over? != true))
      turn
    end

    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end

def replay?
  puts "Would you like to play again? (y/n)"
  answer = gets.strip.downcase
  if (answer == "yes") || (answer == "y")
    puts "Same configuration? (y/n)"
    answer == gets.strip.downcase
      if (answer == "yes") || (answer == "y")
        self.board.reset!
      else
        new_game = Game.config
      end
      self.play
    else
      return false
    end

end


end
