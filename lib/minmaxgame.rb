class MinMaxGame
  attr_reader :level, :value, :board

  def initialize(level, board)
    @board = board
    @level = level
  end
end
