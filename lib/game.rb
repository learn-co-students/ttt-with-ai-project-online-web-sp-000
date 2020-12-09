class Game
attr_accessor :board, :player_1, :player_2

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
  end

def current_player
  turns = turn_count
  return turns % 2 == 0 ? "X" : "O"
end

def turn_count
  count = 0
  self.board.cells.each do  |item|
    if !(item == " " || item == "" )
      count += 1
    end
  end
  count
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

def full?
  self.board.cells.select{ |item| item != " " && !item.nil? && item != ""}.size == 9
end

def draw?
  !(won? || !full?)
end

def over?
  won? || full? || draw?
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
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  while !valid_move?(index)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
  end
  cur_pl = current_player
  move(index, cur_pl)
  display_board
end

end
