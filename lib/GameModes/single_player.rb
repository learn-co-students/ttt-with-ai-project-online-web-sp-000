def single_player
  puts "which token would you like? X or O"
  token = gets.chomp.upcase
  computer_token(token)
end

def computer_token(token)
    if token == "X"
      player = Players::Human.new("X")
      computer = Players::Computer.new("O")
    elsif token == "O"
      player = Players::Human.new("O")
      computer = Player::Computer.new("X")
    else
      puts "Please choose X or O"
      single_player
    end
end
