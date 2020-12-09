class Game
attr_accessor :board, :player_1, :player_2

@next_player

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]]

  def initialize(player_1=players::Human.new, player_2=Players::Human.new, board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @next_player = player_1
  end

  def current_player
    turns = self.board.turn_count
    return turns % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      (self.board.cells[win_combination[0]] == "X" && self.board.cells[win_combination[1]] == "X" && self.board.cells[win_combination[2]] == "X") ||
      (self.board.cells[win_combination[0]] == "O" && self.board.cells[win_combination[1]] == "O" && self.board.cells[win_combination[2]] == "O")
   end
  end

  def winner
    if won?
      if( WIN_COMBINATIONS.detect {|win_combination|
        (self.board.cells[win_combination[0]] == "X" && self.board.cells[win_combination[1]] == "X" && self.board.cells[win_combination[2]] == "X") })
        return  "X"
      else
        return "O"
      end
    end
     nil
  end

  def start
  end

  def draw?
    !(won? || !self.board.full?)
  end

  def over?
    won? || self.board.full? || draw?
  end

  def play
    while !over?
          turn
        end
        if won?
          currentwinner = winner
          puts "Congratulations #{currentwinner}!"
        else
          puts "Cat's Game!"
        end
  end

  def turn
    input = next_player.move(board)
    index = input_to_index(input)
    while !self.board.valid_move?(index)
      input = next_player.move(board)
      index = input_to_index(input)
    end
    if next_player == player_1
      next_player = player_2
    else
      next_player = player_1
    end
    cur_pl = current_player
    self.board.update(index, current_player.token)
    move(index, cur_pl)
    display_board
  end

end
