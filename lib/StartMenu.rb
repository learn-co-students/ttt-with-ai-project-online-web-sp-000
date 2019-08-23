  require 'pry'
class TicTacToe
  attr_reader :game_mode, :token

  def initialize
    @game_mode = nil
    @token = nil
  end

  def start
    puts "Welcome to Tic Tac Toe!"
    get_user_input
    select_mode
  end

  def select_mode
    #binding.pry
    if @game_mode == '0'
      ai_v_ai
    elsif @game_mode == '1'
      single_player
    elsif @game_mode == '2'
      two_player
    else
      start
    end
  end

  def get_user_input
      puts "Pease select how many players"
      puts "0, 1, 2 "
      @game_mode = gets.chomp
  end

  def ai_v_ai
    comp_1 = Players::Computer.new("X")
    comp_2 = Players::Computer.new("O")
    new_game = Game.new(comp_1, comp_2)
    new_game.play
  end

  def single_player
    puts "Please enter which token you would like to be! X or O?"
    @token = gets.chomp.upcase
    computer_token(@token)
  end

  def computer_token(token)
      if token == "X"
        player = Players::Human.new("X")
        comp = Players::Computer.new("O")

      elsif token == "O"
        player = Players::Human.new("O")
        comp = Players::Computer.new("X")
      elsif token == "EXIT"
        exit
      else
        puts "Please choose X or O"
        single_player
      end
      new_game = Game.new(player,comp)
      new_game.play
  end

  def two_player
    puts "Please enter which token you would like to be! X or O?"
    token = gets.chomp.upcase
    if token == "X"
      player_1 = Players::Human.new(token)
      player_2 = Players::Human.new("O")
    elsif token == "O"
      player_1 = Players::Human.new(token)
      player_2 = Players::Human.new("X")
    elsif token == "EXIT"
      exit
    else
      puts "Not valid input"
      two_player
    end
      new_game = Game.new(player_1, player_2)
      new_game.play
  end


end
