class TicTacToe
  def initialize
    @token = []
  end

  def start
    puts "Welcome to Tic Tac Toe!"
    user_input = get_user_input
    select_mode(user_input)
  end

  def select_mode(input)
    if input == 0
      ai_v_ai
    elsif input == 1
      single_player
    elsif input == 2
      two_player
    else
      start
    end
  end

  def get_user_input
      puts "Pease select how many players"
      puts "0, 1, 2 "
      user_input = gets
      user_input.to_i
  end

  def ai_v_ai
    comp_1 = Players::Computer.new("X")
    comp_2 = Players::Computer.new("O")
    new_game = Game.new(comp_1, comp_2)
    new_game.play
  end

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

  def two_player
    puts "which token would you like? X or O"
    token = gets.chomp.upcase
    token = "X"? player_1="X" : player_2="X"
  end

end
