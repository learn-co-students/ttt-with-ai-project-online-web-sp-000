class Game
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
  
  attr_accessor :board, :player_1, :player_2
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end
  
  def won?
    WIN_COMBINATIONS.each do |combo|
      check = [@board.cells[combo[0]], @board.cells[combo[1]], @board.cells[combo[2]]]
      return combo if !check.any? { |token| token == " "} && check.all? { |token| token == check[0] }
    end
    false
  end
  
  def draw?
    !@board.cells.any? { |token| token == " "} && won? == false
  end
  
  def over?
    draw? || won?
  end
  
  def winner
    won? ? @board.cells[won?[0]] : nil
  end
  
  def turn
    move = current_player.move(@board)
    turn if !@board.valid_move?(move)
    @board.update(move, current_player)
  end
  
  def play
    while !over?
      turn
      board.display
      puts "\n"
    end
    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
  end
end












