def player_select
  number_of_players = gets.strip
if number_of_players == "1" then
  puts "Who would you like to go first? Human or Computer"
  player_a = gets.strip
  puts "Would you like to be X or O"
  player_token = gets.strip
  if player_token == "X" then computer_token = "O"
  else computer_token = "X"
  end
  if player_a == "Human" then game = Game.new(Players::Human.new(player_token),Players::Computer.new(computer_token))
  else game = Game.new(Players::Computer.new(computer_token),Players::Human.new(player_token))
  end
elsif number_of_players == "0" then game = Game.new(Players::Computer.new("X"),Players::Computer.new("O"))
elsif number_of_players == "2" then game = Game.new(Players::Human.new("X"),Players::Human.new("O"))
else "Please learn how the game of Tic-tac-toe is played and try again later"
  player_select
end
game.play
end
