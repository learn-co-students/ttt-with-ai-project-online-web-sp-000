require 'bundler'
Bundler.require

require_all 'lib'

def greeting
    puts "Hello! TicTacToe is my favorite game!"
    puts "It's so fun! On a scale of 1-10,"
    puts "how much do you like TicTacToe?"
    input = gets.strip.to_i
    if input < 5
        puts "Really? That's too bad. Wanna play anyway?"
    elsif input > 5 && input <= 7
        puts "Got it. Better than getting teeth pulled,"
        puts "but not as fun as cotton candy."
    elsif input > 7 && input <= 9
        puts "Dang, you almost like it as much as I do!"
    else
        puts "Wow! I've never played with anyone who"
        puts "likes TicTacToe as much as I do! Lets go!!!"
    end
    start
end

def pvc
    puts "Whoever goes first is gonna be 'X'. To decide who"
    puts "is going to go first, we will compete in a simple"
    puts "math-off. You know Calculus, right?!? Just kidding"
    puts "If you would like to go first, enter 1."
    puts "If you want me to go first, enter 2"
    input = gets.strip.to_i
    if input == 1
        game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
        game.play
    elsif input == 2
        game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        game.play
    else
        puts "Are you being intentionally difficult,"
        puts "or was that a fat finger moment?"
        puts "Either way, lets try that again."
        pvc
    end
end

def pvp
    puts "Whoever goes first is gonna be 'X'. Like my"
    puts "motherboard always said, 'age before beauty'"
    puts "so whoever is older will go first. I am sure"
    puts "you two can figure that one out. Lets go!"
    game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    game.play
end

def cvc
    puts "Yay! There is only one thing I love"
    puts "more than playing TicTacToe, and that"
    puts "is playing TicTacToe by myself, cause"
    puts "no matter what I always win!"
    game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
    game.play
end

def start
    puts "What kind of game do you want to play?"
    puts "To play against me(the best choice), enter 1."
    puts "To play against another person, enter 2."
    puts "If you just want to watch, ;P enter 3."
    input = gets.strip.to_i
    if input == 1
        pvc
    elsif input == 2
        pvp
    elsif input == 3
        cvc
    else
        puts "I am pretty sure that wasn't an option,"
        puts "but I have been wrong before..."
        puts "Lets start over, I'm sure we can figure it out."
        start
    end
end