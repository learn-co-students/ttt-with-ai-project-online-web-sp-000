require 'pry'

class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def cells
    @cells
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def to_index(input)
    pos = input.to_i-1
    pos
  end

  def position(input)
    pos = @cells[input.to_i-1]
    pos
  end

  #def won?
    #WIN_COMBINATION.each do |win_combo|
      #if (@cells[win_combo[0]] == "X" && @cells[win_combo[1]] == "X" && @cells[win_combo[2]] == "X" || @cells[win_combo[0]] == "O" && @cells[win_combo[1]] == "O" && @cells[win_combo[2]] == "O")
        #return win_combo
      #end
    #end
    #false
  #end

  def full?
    if @cells.any? {|space| space == " " || space == ""}
      false
    else
      true
    end
  end

  #def draw?
    #if full? && !won?
      #true
    #end
  #end

  def turn_count
    a = []
    @cells.each { |cell|
      if cell != " "
        a << cell
      end
    }
     a.count
  end

  def whose_turn
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def betw?(input)
    if input.between?(1,9)
      return true
    else
      return false
    end
  end

  def taken?(input)
    if @cells[to_index(input)] == " " || @cells[to_index(input)] == nil
      false
    else
      true
    end
  end

  def valid_move?(input)
    if !taken?(input.to_i) && betw?(input.to_i)
      true
    else
      false
    end
  end

  def update(input, player)
    @cells[to_index(input)] = player.token
  end

end
