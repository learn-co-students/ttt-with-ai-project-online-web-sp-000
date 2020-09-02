require 'pry'

class Board

  def initialize()
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def cells
    @cells
  end

  def cells=(inputArray)
    @cells = inputArray
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts " ----------- "
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts " ----------- "
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  #  binding.pry
  end

  def position(userInput)
    arrayInput = (userInput.to_i - 1)
    return @cells[arrayInput]
  end

  def update(userInput, player)
    arrayInput = (userInput.to_i - 1)
    @cells[arrayInput] = player.token
  end

  def full?
    @cells.each do | position |
      if (position == " " || position == nil || position == "")
        return false
      end
    end
    return true
  end

  def taken?(userInput)
    arrayInput = (userInput.to_i - 1)
    if (@cells[arrayInput] == "X" || @cells[arrayInput] == "O")
      return true
    else
      return false
    end
  end

  def turn_count
    turns = 0
    @cells.each do | position |
      if (position == "X" || position == "O")
        turns += 1
      end
    end
    return turns
  end

  def valid_move?(userInput)
    arrayInput = (userInput.to_i - 1)
    if (arrayInput >= 0 && arrayInput <= 8)
      if !(self.taken?(userInput))
        return true
      else
        return false
      end
    else
      return false
    end
  end

end
