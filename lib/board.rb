## Objectives
# 1. Build a command-line interface (CLI).
# 2. Create a domain model with multiple relating and collaborating objects.

class Board
  attr_accessor :cells

  def initialize
    @cells = [] 
  end

end
