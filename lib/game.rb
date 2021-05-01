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

  @board = []

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def start
    puts "Welcome to Tic-Tac-Toe!"
    main_menu
  end

  def main_menu
    puts "How many players? Enter 0, 1, 2."
    answer = gets.strip

    case answer
      when "0"
        @player_1 = Players::Computer.new("X")
        @player_2 = Players::Computer.new("O")
        puts "Computer versus Computer. Victory is mine..."
        play
        again
      when "1"
        @player_2 = Players::Computer.new("O")
        puts "You versus Computer. Best of luck, Human."
        play
        again
      when "2"
        puts "Human versus Human. Game on."
        play
        again
      when "exit"
    else
      puts "Does...not...compute. Try another option."
      main_menu
    end
  end

  def again
    puts "Would you like to play again? Enter Y or N."
    input = gets.strip

    if input.upcase == "Y"
      start
    elsif input.upcase == "N"
      puts "Thanks for playing. See you next time!"
      "exit"
    else
      puts "Rewind, and try another option."
      again
    end

  end

  def current_player
    board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      if  board.cells[combo[0]] == board.cells[combo[1]] &&
          board.cells[combo[1]] == board.cells[combo[2]] &&
          board.taken?(combo[0]+1)

          return combo
      end
    end
      false
  end

  def draw?
    board.full? && !self.won? ? true : false
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      array = won?
      board.cells[array[0]]
    else
      nil
    end
  end

  def turn
    puts "Please enter 1-9:"
    board.display
    input = current_player.move(board)

    if board.valid_move?(input)
      board.update(input, current_player)
    else puts "Please enter 1-9:"
      board.display
      turn
    end
  end

  def play
    turn until over?

    if won?
      board.display
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
