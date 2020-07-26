class Game
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]
  attr_accessor :board, :player_1, :player_2
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
   end
   def current_player
     count = board.turn_count
     if count % 2 == 0
        player_1
     else
        player_2
     end
   end
   def won?
    won_x = WIN_COMBINATIONS.map{|e|  e.select{|i| board.cells[i] == "X"}}
    won_o = WIN_COMBINATIONS.map{|e|  e.select{|i| board.cells[i] == "O"}}
     if won_x.select{|e| e.length == 3}[0]
        won_x.select{|e| e.length == 3}[0]
     elsif won_o.select{|e| e.length == 3}[0]
        won_o.select{|e| e.length == 3}[0]
      #  elsif board.cells.select{|letter| letter == "X" || letter == "O"}.length == 9
      #     false
     else
         false
     end
 end

 def draw?
    board.turn_count == 9 && won? == false
 end

 def over?
    won? != false || draw?
 end

 def winner
   if won? != false
   board.cells[won?[0]]
   end
 end

 def turn
   string = ""
       loop do
           player_input = current_player.move(board)
           valid =  board.valid_move?(player_input)
         if !valid
           puts "invalid"
         elsif  valid
           string = player_input
            break
         end
         string = player_input
       end
       board.update(string.to_i, current_player)
       string
  end

  def play
      while over? == false
        turn
        winner
        won?
        puts  board.display
      end
       if winner == "O"
         puts "Congratulations O!"
         winner
       elsif  winner == "X"
         puts "Congratulations X!"
         winner
       elsif draw?
         puts "Cat's Game!"
       end
   end

end
