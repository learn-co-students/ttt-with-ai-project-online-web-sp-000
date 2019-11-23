class  Board

  attr_accessor :cells

  def initialize
    @cells = Array.new(9," ")
    @cells.map do |cell|
      cell.to_s
    end
  end

  def reset!
    self.cells = Array.new(9," ")
  end

  def display

    puts " #{self.cells[0]}" + " | " + "#{self.cells[1]}" + " | " + "#{self.cells[2]} "
    puts "------------"
    puts " #{self.cells[3]}" + " | " + "#{self.cells[4]}" + " | " + "#{self.cells[5]} "
    puts "------------"
    puts " #{self.cells[6]}" + " | " + "#{self.cells[7]}" + " | " + "#{self.cells[8]} "

  end

  def position(gets)
    self.cells[gets.strip.to_i - 1]
  end

  def full?
    self.cells.all? {|position| position != " "}
  end

  def turn_count
    turns = self.cells.select {|position| position != " "}
    turns.length
  end

  def taken?(position)

    if self.cells[position.to_i - 1].upcase == "X" || self.cells[position.to_i - 1].upcase == "O"
      true
    else
      false
    end
  end

  def valid_move?(position)

    if self.taken?(position) || position == "invalid"
      false
    else
      true
    end
  end

  def update(position, player)
    self.cells[position.to_i - 1] = player.token
  end

end
