class Cli

  def start
  	# Three differt styles of playing Tic Tac Toe 
  	# 1. Greet the user with a message.
	# 2. Prompt the user for what kind of game they want to play, 0,1, or 2 player.
	# 3. Ask the user for who should go first and be "X".
	# 4. Initialize game object based on input values 
	# => Use the input to correctly initialize a Game with the appropriate player types 
	# and token values.	
	
	puts "Welcome to Tic Tac Toe!"
	puts
	puts "Enter 0 to have the computer play against itself < 0 players>"
	puts "Enter 1 if you want to play against the computer < 1 player>"
	puts "Enter 2 if you want to play against someone else < 2 players>"

	num_of_players = gets.strip

	# puts "Enter your name for player 1 who is X " 
	# player_1_name = gets.strip
	
	# puts "Enter your name for player 2 who is O "
	# player_2_name = gets.strip

	# puts "Enter 'O' if you player 2 who wil go second"

	# player = gets

	# if player == "X"
	# 	player_1 = "X"
	# elsif condition
	# 	player_2 = "O"
	# else
	# 	puts "incorrect input please enter 'X' or 'O'"
	# end

	case  num_of_players
		when "0"
			puts "you have entered #{num_of_players} player(s) mode"
		when "1"
			puts "you have entered #{num_of_players} player(s) mode"
		when "2"
			puts "you have entered #{num_of_players} player(s) mode"
			game = Game.new
		else 
			puts "you must input a value between 0 and 2"
			start
	end	
  
	game.play
  end
end