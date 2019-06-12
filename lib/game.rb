class Game
  attr_accessor :board, :player_1, :player_2, :game_type, :first_player
  WIN_COMBINATIONS = [
                      [0,1,2], [3,4,5], [6,7,8], # across
                      [0,3,6], [1,4,7], [2,5,8], # down
                      [0,4,8], [2,4,6] # diagonally
                     ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    self.board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.find do |v|
      self.board.cells.values_at(v[0],v[1],v[2]) == ['X', 'X', 'X'] || self.board.cells.values_at(v[0],v[1],v[2]) == ['O', 'O', 'O']
    end
  end

  def draw?
    self.board.full? & !won?
  end

  def over?
    self.board.full? || won? || draw?
  end

  def winner
    won? == nil ? nil : self.board.cells[won?[0]]
  end

  def get_input
    input = gets.chomp
  end

  def turn
    puts "Please enter a move"
    move = current_player.move(self.board)
    move = current_player.move(self.board) if !self.board.valid_move? (move)
    self.board.update(move, current_player)
    self.board.display
  end

  def play
    turn while !over?
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
