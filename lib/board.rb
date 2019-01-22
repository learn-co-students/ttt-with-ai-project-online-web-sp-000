 require 'pry'
 class Board
   attr_accessor :cells

   def initialize
     @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
   end

   def reset!
   @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
   end

   def display
     puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
     puts "-----------"
     puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
     puts "-----------"
     puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
   end

   def position(user_input)
     @cells[user_input.to_i - 1]
   end


   def full?
     cells.all? {|cell| cell == "X" || cell == "O"}
   end

   def turn_count  # iterate and count to look at each element of cells and if there is an "X" or "O" and then increments the count
     #@cells.collect {|x| x == " "}.size / 3  => assigns the board empty spaces
     cells.count do |token|
       token == "X" || token == "O"
     end
   end

   def taken?(position)
     cells[position.to_i - 1] == "X" || cells[position.to_i - 1] == "O"
   end


    def valid_move?(position)
      !taken?(position) && position.to_i.between?(1,9)
    end

    def update(position, player)
      cells[position.to_i - 1] = player.token
    end

#     def block(token)
#     #  return index of where to block use boolean
#     end
# #difference is the current player
#     def wins(token)
#     # return an index of a win and make a move or return a nil
#     end
#
#
#     #After turn_count == "2" check win combos(make this a priority) or block method
#     #Check where I have 2 matching tokens
#     #compare
#     #move into that empty cell that matches a win combo
#     #board.check_for_wins_or_blocks or return nil
#
#     def check_for_wins_or_blocks(token)
#
#       #figure out whose turn it is happens in computer.rb
#
# # either returns “nil” if there’s no place to go that fits the description of a win or block
# # OR returns the index of where you SHOULD go, because that DOES exist
    end
