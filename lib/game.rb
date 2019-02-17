require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2
  attr_reader :game_type, :who_is_first, :play_again_answer

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

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if board.turn_count.even?
      @player_1
    else
      @player_2
    end
  end

  def winning_combo?
    WIN_COMBINATIONS.detect do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] != " "
    end
  end

  def draw?
    !winning_combo? && board.cells.all? {|cell| cell == "X" || cell == "O"}
  end

  def won?
    if winning_combo? != nil
      true
      winning_combo?
    elsif !draw?
      false
    end
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      board.cells[winning_combo?[0]]
    else
      nil
    end
  end

  def turn
    current_player.move(board)
    if board.valid_move?(current_player.input)
      board.update(current_player.input, current_player.token)
    else
      current_player.move(board)
    end
  end

  def play
    until over?
      puts "#{current_player.token}'s turn!"
      turn
    end

    if over?
      if won?
        board.display
        puts "Congratulations #{winner}!"
      elsif draw?
        board.display
        puts "Cat's Game!"
      end
    play_again?
    end

  end

  def welcome
    puts "Welcome to Tic-tac-toe!"
    choose_game_type
    if @game_type == "0"
      Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
    elsif @game_type == "1"
      if @who_is_first == "c"
        Game.new(Players::Computer.new("X"), Players::Human.new("O"))
      elsif @who_is_first == "h"
        Game.new(Players::Human.new("X"), Players::Computer.new("O"))
      end
    elsif @game_type == "2"
      Game.new(Players::Human.new("X"), Players::Human.new("O"))
    end
    play
  end

  def choose_game_type
    puts "What mode do you want to play this game in:"
    puts "   for Computer vs. Computer: type 0"
    puts "   for Computer vs. Human: type 1"
    puts "   for Human vs. Human: type 2"
    @game_type = gets.chomp

    if @game_type == "1"
      puts "Who should go first?"
      puts "   for computer, type c"
      puts "   for human, type h"
      @who_is_first = gets.chomp
    end
  end

  def play_again?
    puts "Would you like to play again?"
    puts "   to play again, type yes"
    puts "   to exit, type no"
    @play_again_answer = gets
    if @play_again_answer == "yes"
      welcome
    end
  end

end
