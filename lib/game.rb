class Game

  attr_accessor :board, :player_1, :player_2

WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #diagonal 1
  [2,4,6], # diagonal 2
  ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1=player_1
    @player_2=player_2
  end

  def current_player
    if board.turn_count.odd?#counting the number of turns that have happened, not the current number
      player_2
    else
      player_1
    end
  end

  def won?
    winning_combo =[]
    WIN_COMBINATIONS.find do |array| #taken? takes in the postion (not index)
      if board.taken?(array[0]+1) && board.cells[array[0]] == board.cells[array[1]] && board.cells[array[1]] == board.cells[array[2]]
        winning_combo = array
      end #returns nil if no winner. nil is considered falsey
    end
  end

  def draw?
    if board.full? && !won? then true
    end
  end

  def over?
   if draw? || won? then true
    end
  end

  def winner
    if won? != nil
      board.cells[won?[0]]
    end
  end

  def turn
     puts "#{current_player}, please enter the number of your next move:"
     choice=gets.strip
  end

end
