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
    [6,4,2]
  ]


  def initialize(player_1=Players::Human.new("X"),player_2=Players::Human.new("O"),board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if @board.cells[combo[0]] == @board.cells[combo[1]] &&
         @board.cells[combo[0]] == @board.cells[combo[2]] &&
         @board.cells[combo[0]] != " "
         return combo
      end
    end
    return false
  end

  def draw?
    !won? && @board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    @board.cells[won?[0]] if won?
  end

  def turn
    @board.display
    puts "#{current_player.token}: Make a move!"
    input = ""
    quit = 0
      while quit == 0
        input = current_player.move(@board)
        if @board.valid_move?(input)
          quit = 1
        else
          @board.display
          puts "Invalid move, try again"
        end
      end
      @board.update(input, current_player)
  end

  def play
    while !over?
      turn
    end
    @board.display
    puts "Congratulations X!" if winner == "X"
    puts "Congratulations O!" if winner == "O"
    puts "Cat's Game!" if draw?
  end

  def self.get_player_count
    valid_pc = nil
    player_count = -1
    while valid_pc == nil
    puts "Welcome. 0, 1, or 2 players?"
      player_count = gets.chomp.to_i
      valid_pc = 1 if player_count == 0 || player_count == 1 || player_count == 2
    end
    return player_count
  end

  def self.get_start_player
    valid_start = 0
    start_player = ""
    while valid_start == 0
      puts "Who should go first? 1 for human or 2 for computer."
      start_player = gets.chomp.to_i
      valid_start = 1 if start_player == 1 || start_player == 2
    end
    return start_player
  end

  def self.start
    player_count = get_player_count

    case player_count
    when 0
      Game.new(Players::Computer.new("X"),Players::Computer.new("O"))
    when 1
      if get_start_player == 1
        Game.new(Players::Human.new("X"),Players::Computer.new("O"))
      else
        Game.new(Players::Computer.new("X"),Players::Human.new("O"))
      end
    when 2
      Game.new(Players::Human.new("X"),Players::Human.new("O"))
    end
  end
end
