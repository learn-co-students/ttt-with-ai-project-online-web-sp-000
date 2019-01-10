require 'pry'
class Game
    attr_accessor :player_1, :player_2, :board, :winner
    
    extend Players
  
    def initialize(player_1, player_2, board = Board.new)
      @board = board 
      @player_1 = player_1 
      @player_2 = player_2
    end 
  
  WIN_COMBINATIONS = [[0, 1, 2],[3, 4, 5],[6 ,7 ,8],[0, 3, 6],[1, 4, 7],[2, 5, 8],[0,4, 8],[2, 4, 6]]
  
  def current_player 
    if board.turn_count.even?
      return player_1 
      elsif board.turn_count.odd? 
      return player_2 
    end
  end 
  
  def won?
    
    WIN_COMBINATIONS.each do |win_combination|
      win_index0 = win_combination[0]
     win_index1 = win_combination[1]
      win_index2 = win_combination[2]

    position_1 = @board.cells[win_index0]
   position_2 = @board.cells[win_index1]
    position_3 = @board.cells[win_index2]

  if (position_1 == "X" && position_2 == "X" && position_3 == "X")
   return win_combination
  elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
    return win_combination
  end
  end
  return false
   
  
  end 
  
  def draw?
   @board.full? && !won?
  end 
  
  def over? 
    won? || draw?
  end
  
  def winner 
    if win_combo = won? 
      
      @winner = @board.cells[win_combo.first]
      #binding.pry
      
    end
    end
  
  # def start 
    
  #   puts "Welcome to Tic-Tac_Toe!" 

  #   puts "Do you have 0, 1 or 2 players?"

  #   user_game_type = gets
    
  #   if user_game_type == 0 
  #     @comp_1 = Players::Computer.new("X") 
  #     @comp_2 = Players::Computer.new("O")
    
  #   elsif user_game_type == 1 
  #     puts "Do you want to go first and be X or go second and be O?"
  #     puts "Type X or O"
  #     token_choice = gets 
  #     if token_choice == "X" 
  #       @hum_1 = Players::Human.new("X")
  #       @comp_2 = Players::Computer.new("O")
  #     elsif token_choice == "O" 
  #       @comp_1 = Players::Computer.new("X")
  #       @hum_2 = Players::Human.new("O")
  #     end
  #   elsif user_game_type == 2 
  #     @hum_1 = Players::Human.new("X")
  #     @hum_2 = Players::Human.new("O")
  #   end 
      
  # end 
  
  def play 
    say_winner = winner
    
    until over?
     turn 
   end 
   
      if over? && draw? 
      puts "Cat's Game!"
      elsif over? && won?
      puts "Congratulations #{winner}!"
    
       
     
     
    end 
    
  end 
  
 
  
  def turn
    
    prompt_user = current_player.token
    
    
    puts "Player #{prompt_user} enter 1-9:"
    
     user_input = current_player.move(board)
     
    if board.valid_move?(user_input) && current_player == player_1
      board.update(user_input, @player_1)
      puts board.display
      elsif board.valid_move?(user_input) && current_player == player_2
      board.update(user_input, @player_2)
      puts board.display
    else 
      puts "Invalid or taken try again."
      turn 
      
    end

  end 
  
end 