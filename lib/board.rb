class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    self.cells = [" "," "," "," "," "," "," "," "," "]
  end
end
