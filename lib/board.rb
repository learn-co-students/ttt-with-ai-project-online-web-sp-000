# hi = Players::Human.new("X") #doesnt work
# puts hi.token
#hello = Player.new #also doesnt work
#basically the only way it works is in the bin/tictactoe


class Board
  attr_accessor :cells
  #cells: is is an instnace variable

  #reset instance method: make board blank.

  def initialize
    reset!()
  end

  def reset!
    @cells = [" "] * 9
  end
  #display method: display board
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(onetonine)
    number = onetonine.to_i
    @cells[number-1]
    #returns like X or O
  end


  def full?
    @cells.none? do |item|
    item == " " || item   == ""
    end
   #return true or false. if none is empty returns true. it's true board is full
  end


  def turn_count
    #we assume tokesn are X or O only. if they are different this needs to be modified
    turns = 0

    @cells.each do | item |
      if item == "X" || item == "O"
        turns +=1
      end
    end

    return turns
  end

  def taken?(onetonine)
    index = onetonine.to_i - 1
    @cells[index] != " " && @cells[index] != ""
  end

  def valid_move?(onetonine)
    index = onetonine.to_i - 1
    index.between?(0,8) && !taken?(onetonine)
  end

  def update(onetonine, playerobject)
     @cells[onetonine.to_i - 1] = playerobject.token
     #ex: if onetonine = "9". we do @cells[8] = X/O
    #we set that item to the value of either X or O, which is the player's token
  end


end #end class
