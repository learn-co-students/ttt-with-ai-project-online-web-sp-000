module Players
  class Computer < Player
    def initialize(token)
      super
      @edges = ['1','3','7','9'].shuffle
      @cross = ["2", "4", '6', '8'].shuffle
    end
    
    def move(board)
     return "5" unless board.taken?("5")
     @edges.delete_if { |position| board.taken?(position) } if !@edge.empty?
     @cross.delete_if { |position| board.taken?(position) } if !@cross.empty?
     return @edge.pop() if !@edge.empty?
     return @cross.pop() if !@cross.empty?
    end
  end
end