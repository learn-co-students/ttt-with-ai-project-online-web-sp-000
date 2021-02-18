class Game
  attr_accessor :board, :player_1, :player_2
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]  

def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  @player_1 = player_1
  @player_2 = player_2
  @board = board
end 
  
def turn
  player = current_player
  current_move = player.move(@board)
  if !@board.valid_move?(current_move)
  turn
  else
   @board.update(current_move, player)
  end
end 

def current_player
  move = board.turn_count
  if move % 2 == 0
  player_1
  else 
  player_2
  end 
end 

def won?
  WIN_COMBINATIONS.find do |win_combination|
  @board.cells[win_combination[0]] == @board.cells[win_combination[1]] && @board.cells[win_combination[1]] == @board.cells[win_combination[2]] && @board.taken?(win_combination[0]+1)
end
end 

def draw? 
  !won? && board.full?
end 

def over?
  won? || draw?
end 

def winner
  WIN_COMBINATIONS.each do |win_combination|
 if @board.cells[win_combination[0]] == "X" && @board.cells[win_combination[1]] == "X" && @board.cells[win_combination[2]] == "X"
   return "X"
 elsif @board.cells[win_combination[0]] == "O" && @board.cells[win_combination[1]] == "O" &&@board.cells[win_combination[2]] == "O"
 return "O"
  end
  end
  return nil
end 

def play
  until over?
  player = current_player
  current_move = player.move(@board)
  @board.update(current_move, player)
  end 
  if winner != nil
  puts "Congratulations #{winner}!"
  else 
  puts "Cat's Game!"
  end 
  end
  
def start
  computer = Players::Computer
  human = Players::Human
  puts "What kind of game would you like to play? (0),(1) or (2) player?"
  input1 = gets
  puts "Who should go first and be X? Player_1(1) or Player_2(2)?"
  input2 = gets
  if input1 == "0" && input2 == 
  game = Game.new(computer,computer,board)
  game.play
  elsif input1 == "1"
  game = Game.new(player,computer,board)
  game.play
  elsif input1 == "2"
  game = Game.new(player,player.board)
  game.play
  end 
  puts "Who should go first and be X?"
  input2 = gets
  
  end
  
end 