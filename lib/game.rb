class Game
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  
  def initialize(player_1 = Player.new("X"), player_2 = Player.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  
  def player_1
    @player_1
  end
  
  def player_2
    @player_2
  end

  def board
    @board 
  end
  
  def current_player
    if board.turn_count % 2 != 0 
      player_1.token ## "X"
    else
      player_2.token ##"O"
    end
  end
  
  def won?
    i = 0
    current_player_array = [] ##array containing current player's board positions
    while i <= board.cells.count 
      if board.cells[i] == current_player
        current_player_array << i ##addition of each of current player's board positons
      end           
      i+=1
    end
    winning_array = []
    WIN_COMBINATIONS.each{|win_combination| 
      position0 = win_combination[0]
      position1 = win_combination[1]
      position2 = win_combination[2]
      if current_player_array.include?(position0)
        winning_array << position0
      if current_player_array.include?(position1)
        winning_array << position1
      if current_player_array.include?(position2)
        winning_array << position2
      }
    if winning_array.count == 3 && WIN_COMBINATIONS.include?(winning_array) == true
      true
    else
      false
  end
  
  def winner
    if won? == true
      current_player
    else
      nil
    end
  end
  
  def draw?
    if won? == false && board.full? == true
      true
    else
      false
    end
  end
  
  def over?
    if won? == true || draw? == true
      true
    else
      false
    end
  end

  def turn
    current_player
    puts "Please enter a valid move: #1-9"
    board.user_input
    if board.valid_move? == true
      board.update
    else
      while board.valid_move? == false
        puts "Invalid move. Try again, please."
        board.user_input
        if board.valid_move? == true
          board.update
        end
      end
    end
  end
  
  
end