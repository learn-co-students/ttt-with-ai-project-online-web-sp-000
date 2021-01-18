class Initializer

    def greet
        puts "Hello! Welcome to AI tictactoe."
        ask_for_number_of_players
    end

    def ask_for_number_of_players
        puts "Would you like a 2 player game, 1 player, or 0 player? Answer 0, 1, or 2"
        number_of_players = gets.strip.to_i

        until [0, 1, 2].include?(number_of_players)
            puts "Please enter only the numerals 0, 1, or 2"
            number_of_players = gets.strip.to_i
        end

        if number_of_players == 1
            ask_for_player_token
        else
            game_type(number_of_players)
        end
    end

    def game_type(number_of_players)

        if number_of_players == 2 
            play(Players::Human.new("X"), Players::Human.new("O"))
        elsif number_of_players == 0
            play(Players::Computer.new("X"), Players::Computer.new("O"))
        else
            puts "Sorry, something went wrong."
            ask_for_number_of_players
        end
    end

    def ask_for_player_token
        puts "Would you like to play as X or O? X goes first. Please answer just X or just O."
        human = gets.strip.downcase

        until ["x", "o"].include?(human)
            puts "Please enter just X or just O."
            human = gets.strip.downcase
        end

        if human == "x"
            play(Players::Human.new("X"), Players::Computer.new("O")) 
        elsif human == "o"
            play(Players::Computer.new("X"), Players::Human.new("O"))
        else
            puts "Sorry, something went wrong."
            ask_for_number_of_players
        end

    end

    def play(player_1, (player_2))
        game = Game.new(player_1, player_2)
        game.play
    end

end
