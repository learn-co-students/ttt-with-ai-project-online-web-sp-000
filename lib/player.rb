class Player
    attr_reader :token

    def initialize(token)
        @token = token
    end
end


# Players::Human
# Define a class Human that inherits from Player. This class should be namespaced inside the module Players because the human.rb file is inside the players/ directory

# The Player class is not actually a valid player of Tic-tac-toe but rather a root class that will act as an inheritance point for actual player classes such as Human < Player and Computer < Player


#he Player root class will define only the most basic properties of a player, that they have a token property that can be set upon initialization.


#Every player subclass will implement a #move method that represents how that type of player makes a move in Tic-tac-toe.
#? put in this class or subclasses? 

