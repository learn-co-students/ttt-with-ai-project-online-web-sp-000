require "pry"

class Board

  attr_accessor :board, :cells

  @@cells = []

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def cells
    @@cells
  end

  def reset!
    board = self.cells
    board = Array.new(9, " ")
#binding.pry

  end

end
