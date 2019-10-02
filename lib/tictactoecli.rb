 
class TicTacToeCLI 
  
  def call  
   
  puts "Welcome to Ultimate Tic Tac Toe!  Do you want to play against a human, a computer, or nobody?"
    first_input = gets.strip 
        
    
    if first_input.downcase == "human"
      game = Game.new 
        until game.won?
          game.play 
        end 
    elsif first_input.downcase == "computer"
      game = Game.new(Players::Human.new("X"), Players::Computer.new("O")) 
          until game.won?
            game.play 
          end 
      elsif first_input.downcase == "nobody"
      game = Game.new(Players::Computer.new("X"), Players::Computer.new("O")) 
        until game.won?
          game.play 
        end 
      else call 
    end 
=begin 
      
    first_input = gets.strip 
    if first_input == "human"
      
      game = Game.new
      until game.won?
        game.play
      end 
      elsif "computer"
      game = Game.new(Players::Human.new("X"), Players::Computer.new("O")) 
      until game.won?
        game.play 
      end 
    end 
      
   # elsif input == "computer"
   #   game = Game.new(Players::Human.new("X"), player_2 = Players::Human.new("O"))
   #    until game.won?
   #   game.play 
   #  end 
   #  end 
=end 
    if game.over?
      puts "Would you like to play again? Y or N"
      input = gets.strip 
      if input == "Y" || input == "y"
        call 
      else 
        puts "Thanks for playing.  Goodbye."
      end 
    end 
  end


end 
