require 'pry'
module Players
  class Computer < Player
    SIDES = [2,6,8,4]
    CORNERS = [1,3,7,9]
    # OPPOSITE_CORNERS = [ [1,9], [3,7]]
    
    OPPOSITE_CORNERS = {
      1 => 9,
      3 => 7,
      7 => 3,
      9 => 1
    }
    # binding.pry
    
    
    def move(board)
      # 1 check for any one move wins
      # def can_win?(board)
      # 2 check for blocking one move wins
      # def can_block_win?(board)
      # 3 create fork
      # def can_fork?(board)
      # 4 block opponent fork
      # def can_block_fork?(board)
      # 5 take center if open
      # def can_take_center?(board)
      # 6 take corner opposite opponent corner
      # def can_opposite_corner?(board)
      # 7 take an empty corner
      # def can_corner?(board)
      # 8 take empty side
      # def side_available?(board)
      "1"

    end
    
    # 1 check for any one move wins
    # return false if none
    # return position if exists
    # def can_win?(board)
    # end
    
    # 2 check for blocking one move wins
    # return false if no opportunities
    # return position if exists
    # def can_block_win?(board)
    # end
    
    # 3 create fork
    # return false if forks taken
    # return first fork available if exists
    # def can_fork?(board)
    # end
    
    # 4 block opponent fork
    # return false if no opportunities
    # return position if fork
    # def can_block_fork?(board)
    # end
    
    
    # 6 take corner opposite opponent corner
    # returns false if no opportunities
    # return position if exists
    def can_opposite_corner?(board)
      # Are there open corners?
      open_corners = CORNERS.find_all do |corner|
        board.taken?(corner) == false ? corner : next
      end
      
      # are open corners opposite opponent
      
    end
    
    # ============== TESTED WORKING ==================
    
    # 5 take center if open
    # return false if taken
    # return center if valid
    def can_take_center?(board)
      board.taken?(5) ? false : true
    end
    
    # 7 take an empty corner
    # return false if all corners taken
    # else return first corner available
    def can_corner?(board)
      CORNERS.find {|p| board.valid_move?(p)}
    end
    
    # 8 take empty side
    # return false if sides taken
    # else return first side
    def side_available?(board)
      SIDES.find {|p| board.valid_move?(p)}
    end
    
    
  end
end
opp_corner_pass = [
  "O", " ", " ",
  " ", " ", " ",
  "O", " ", " "
  ]



b = Board.new
b.cells = opp_corner_pass
p1 = Players::Computer.new("X")
p2 = Players::Computer.new("O")

binding.pry