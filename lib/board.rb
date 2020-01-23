class Board

  attr_accessor :cells

  @cells = []

  # each new instance of the game will be set to an empty board
  def initialize
    self.cells = Array.new(9, " ")
  end

  # can reset the state of the cells in the board
  # sets the cells of the board to a 9 element array of " "
  def reset!
    self.cells = Array.new(9, " ")
  end

  # print current state of the board
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  # takes in user input and returns the value of the board cell
  def position(input)
    # go through current board (@cells) and return the value represented by index
    self.cells[input.to_i-1]
  end

  # When you update the appropriate index in the cells, you will set it equal
  # to the token of the player object by calling the #token method on the player.
  def update(position, player)

  end

  def full?
    @cells.all? { |full| full == "X" || full == "O"}
  end

  # returns the amount of turns based on cell value
  def turn_count
    # use each to iterate over the elements of the board
    # to check if that element is an X or O and increment counter by 1
    # return value of each is the original array
    counter = 0
    @cells.each do |space_count|
      if space_count == "X" || space_count == "O"
          counter += 1
          puts "#{space_count}"
          # return counter
      end
    end
    counter
  end

  # returns true if the position is X or O
  # returns false if the position is empty or blank
  def taken?(index)
    if @cells[index] == " " || @cells[index] == "" @cells[index] == nil
      return false
    else @cells[index] == "X" || @cells[index] == "O"
      return true
    end
  end

  def valid_move?

  end


end
