require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                      [0, 3, 6], [1, 4, 7], [2, 5, 8],
                      [0, 4, 8], [2, 4, 6]]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    if board.turn_count % 2 == 0
      player_1
    else
      player_2
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |combo|
      play = board.cells
      index_1 = combo[0]
      index_2 = combo[1]
      index_3 = combo[2]
      if play[index_1] == play[index_2] && play[index_1] == play[index_3] && play[index_1] != " "
        return combo
      end
    end
    false
  end
  
  def draw?
    if !won? && board.full?
      true
    else
      false
    end
  end
  
  def over?
    if draw? || won?
      true
    else
      false
    end
  end
  
  def winner
    if won?
      board.cells[won?[0]]
    else
      nil
    end
  end
  
  def turn
    current_move = current_player.move(board)
    while board.valid_move?(current_move) != true do
      current_move = current_player.move(board)
    end
    board.update(current_move, current_player)
  end
  
  def play
    while over? == false do
      turn
    end
    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
  
  def over?
    if draw? || won?
      true
    else
      false
    end
  end
  
  def winner
    if won?
      board.cells[won?[0]]
    else
      nil
    end
  end
  
  def start
    puts "Welcome, enter number of players:"
    puts "0 | 1 | 2"
    num = gets.strip.to_i
    case num
    when 0
      Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
    when 1
      puts "Who will be Player 1?"
      puts "computer | human"
      player_1 = gets.strip
      case player_1
      if player_1 == "computer"
        Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new)
      else
        Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
      end
    when 2
      Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new)
    end
  end
end