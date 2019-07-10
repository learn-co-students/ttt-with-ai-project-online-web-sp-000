class TicTacToeCLI
  def call
    puts "Welcome to Tic Tac Toe!"
    puts "\nHow many players? (0-2)"
    input = gets.strip
    if input.to_i == 0
      Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O")).play
    elsif input.to_i == 2
      Game.new.play
    else
      puts "\nWould you like to be X or O?"
      first_player = gets.strip
      if first_player == "X" || first_player == "x"
        Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O")).play
      else
        Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O")).play
      end
    end
  end
end