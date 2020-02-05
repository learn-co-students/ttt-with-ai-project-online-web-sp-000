class Game
  attr_accessor :board, :player_1, :player_2, :input

WIN_COMBINATIONS=[
[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[6,4,2],
]

def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
  @player_1=player_1
  @player_2=player_2
  @board=board
end

def current_player
  board.turn_count % 2==1? self.player_2 : self.player_1
end

def won?
win_com_1=[0,1,2]
win_com_2=[3,4,5]
win_com_3=[6,7,8]
win_com_4=[0,3,6]
win_com_5=[1,4,7]
win_com_6=[2,5,8]
win_com_7=[0,4,8]
win_com_8=[6,4,2]

win_1=board.cells.values_at(0,1,2)
win_2=board.cells.values_at(3,4,5)
win_3=board.cells.values_at(6,7,8)
win_4=board.cells.values_at(0,3,6)
win_5=board.cells.values_at(1,4,7)
win_6=board.cells.values_at(2,5,8)
win_7=board.cells.values_at(0,4,8)
win_8=board.cells.values_at(6,4,2)

if win_1.all?{|index| index=="O"}
  win_com_1
elsif win_1.all?{|index| index=="X"}
  win_com_1
elsif win_2.all?{|index| index=="O"}
  win_com_2
elsif win_2.all?{|index| index=="X"}
  win_com_2
elsif win_3.all?{|index| index=="O"}
  win_com_3
elsif win_3.all?{|index| index=="X"}
  win_com_3
elsif win_4.all?{|index| index=="O"}
  win_com_4
elsif win_4.all?{|index| index=="X"}
  win_com_4
elsif win_5.all?{|index| index=="O"}
  win_com_5
elsif win_5.all?{|index| index=="X"}
  win_com_5
elsif win_6.all?{|index| index=="O"}
  win_com_6
elsif win_6.all?{|index| index=="X"}
  win_com_6
elsif win_7.all?{|index| index=="O"}
  win_com_7
elsif win_7.all?{|index| index=="X"}
  win_com_7
elsif win_8.all?{|index| index=="O"}
  win_com_8
elsif win_8.all?{|index| index=="X"}
  win_com_8
elsif board.cells.all?{|index| index=="X" || index=="O"}
  false
end
end

def draw?
  if self.won? || board.cells.any?(" ")
    false
  elsif board.cells.all?{|index| index=="X" || index=="O"}
    true
  end
end

def over?
  if self.draw? || self.won?
    true
  elsif board.cells.any?(" ")
    false
  end
end

def winner
  win_1=board.cells.values_at(0,1,2)
  win_2=board.cells.values_at(3,4,5)
  win_3=board.cells.values_at(6,7,8)
  win_4=board.cells.values_at(0,3,6)
  win_5=board.cells.values_at(1,4,7)
  win_6=board.cells.values_at(2,5,8)
  win_7=board.cells.values_at(0,4,8)
  win_8=board.cells.values_at(6,4,2)

  if win_1.all?{|index| index=="O"}
    "O"
  elsif win_1.all?{|index| index=="X"}
    "X"
  elsif win_2.all?{|index| index=="O"}
    "O"
  elsif win_2.all?{|index| index=="X"}
    "X"
  elsif win_3.all?{|index| index=="O"}
    "O"
  elsif win_3.all?{|index| index=="X"}
    "X"
  elsif win_4.all?{|index| index=="O"}
    "O"
  elsif win_4.all?{|index| index=="X"}
    "X"
  elsif win_5.all?{|index| index=="O"}
    "O"
  elsif win_5.all?{|index| index=="X"}
    "X"
  elsif win_6.all?{|index| index=="O"}
    "O"
  elsif win_6.all?{|index| index=="X"}
    "X"
  elsif win_7.all?{|index| index=="O"}
    "O"
  elsif win_7.all?{|index| index=="X"}
    "X"
  elsif win_8.all?{|index| index=="O"}
    "O"
  elsif win_8.all?{|index| index=="X"}
    "X"
  end
end

def turn
 puts "Please enter 1-9"
 user_input=current_player.move(board)
 if board.valid_move?(user_input)
    board.update(user_input, current_player)
    board
  else
    turn
  end
end

def play
  puts "Please enter 1-9:"
 turn until over?
 if winner=="X"
   puts "Congratulations X!"
 elsif winner=="O"
   puts "Congratulations O!"
 elsif draw?
   puts "Cat's Game!"
 end
end

end
