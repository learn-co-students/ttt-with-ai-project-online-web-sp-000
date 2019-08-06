class Board
attr_accessor :cells
  def initialize
    self.reset!
  end

  def reset!
    @cells = [" "," "," "," "," "," "," "," "," ",]
  end

  def input_to_index(input)
    index = input.to_i - 1
    index
  end

  def display
      puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
      puts "-----------"
      puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
      puts "-----------"
      puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def full?
      @cells.include?(" ") ? false : true
    end


  def position(input)
    index = self.input_to_index(input)
    @cells[index]
  end

  def valid_move?(input)
    index = self.input_to_index(input)
    if @cells[index] == " " && index <= 8 && index >= 0
       true
     else
       false
    end
  end


  def turn_count
  count = 0
  @cells.each do |element|
    if element == "X" || element == "O"
      count += 1
    end
  end
  count
  end

  def taken?(input)
    index = self.input_to_index(input)
    @cells[index] == "O" || @cells[index] == "X" ? true : false
  end

  def update(input, player)
    index = self.input_to_index(input)
    @cells[index] = player.token
  end
end #of class
