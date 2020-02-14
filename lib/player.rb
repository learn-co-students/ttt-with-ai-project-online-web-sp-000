class Player 
  attr_reader :token 
  def initialize(token)
    @token = token 
  end 
  def assign_players  
    puts "Would you like to play a 0 player (computer player) game, 1 player game, or 2 player game? Or, type 'exit' to exit." 
    input = gets.strip 
    if input == "0"
      game = Game.new
      game.play 
    elsif input == "1"
      puts "Great! You are Player 1, with token X." 
      player1 = Player.new("X") 
      game = Game.new(player1)
      game.play 
    elsif input == "2" 
      puts "Great! You are Player 1, with token O." 
      player1 = Player.new("X") 
      player2 = Player.new("O") 
      game = Game.new(player1, player2) 
      game.play 
    elsif input == "exit"
      exit 
    else 
      puts "Sorry, that is not a recognized command. Please put '0' for twocomputer players, '1' to play against a computer player, and '2' to playagainst another human."
      assign_players  
    end 
  end 
end 