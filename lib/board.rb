class Board
  attr_accessor :cells

  @@cells = []

  def cells
    @@cells
  end

  def reset!
    @@cells.clear
  end
end
