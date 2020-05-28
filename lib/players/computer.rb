require 'pry'
module Players
  class Computer < Player
    SIDES = [2,6,8,4]
    CORNERS = [1,3,7,9]
    WIN_COMBINATIONS = [
    [1,2,3],
    [4,5,6],
    [7,8,9],
    [1,4,7],
    [2,5,8],
    [3,6,9],
    [1,5,9],
    [3,5,7]
    ]
    OPPOSITE_CORNERS = {
      1 => 9,
      3 => 7,
      7 => 3,
      9 => 1
      }
    
    def move(board)
      free = board.cells.each_with_index.find{|c, i| i if c == " "}
      return free[1] + 1
      # binding.pry
    end
    
    # Checks for any one move wins returns array of win combos
    def get_winning_combos(board)
      combos = WIN_COMBINATIONS.collect do |combo|
        if combo.count {|p| board.taken?(p) == true} == 2
          tokens = combo.collect {|p| board.position(p) if board.taken?(p)}
          combo if tokens.compact.all? {|t| t == tokens[0]}
        end
      end
      combos.compact
    end
    
    # 1 check for any one move wins
    # return false if none return position if exists
    def can_win_self?(board)
      combos = get_winning_combos(board)
      combos.each do |combo|
        tokens = combo.collect {|p| board.position(p) if board.taken?(p)}
        if tokens.compact[0] == self.token 
          puts tokens.compact[0]
          return combo.find {|p| board.taken?(p) == false}
        end
      end
      false
    end
        
      
    
    # 2 check for blocking one move wins
    # return false if no opportunities return position if exists
    def can_win_opponent?(board)
      opponent_token = self.token == "X" ? "O" : "X"
      combos = get_winning_combos(board)
      combos.each do |combo|
        tokens = combo.collect {|p| board.position(p) if board.taken?(p)}
        if tokens.compact[0] == opponent_token
          return combo.find {|p| board.taken?(p) == false}
        end
      end
    end
    
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
    
    
    # ============== TESTED WORKING ==================
    
    # 5 take center if open
    # return false if taken return center if valid
    def can_take_center?(board)
      board.taken?(5) ? false : true
    end
    
    # 6 take corner opposite opponent corner
    # returns false if no opportunities return position if exists
    def can_opposite_corner?(board)
      # Are there open corners?
      CORNERS.find_all do |corner|
        # is corner taken?
        if board.taken?(corner) == false
          # if not check opposite
          op_corner = OPPOSITE_CORNERS[corner]
          
          if board.taken?(op_corner) && board.position(op_corner) != self.token
            corner
          else
            next
          end
        end
      end
    end
    
    # 7 take an empty corner
    # return false if all corners taken else return first corner available
    def can_corner?(board)
      CORNERS.find {|p| board.valid_move?(p)}
    end
    
    # 8 take empty side
    # return false if sides taken else return first side
    def side_available?(board)
      SIDES.find {|p| board.valid_move?(p)}
    end
    
    
  end
end

p1 = Players::Computer.new("X")
b = Board.new

test = [
  "O", "X", " ",
  " ", " ", "",
  " ", " ", " ",
  ]
win = [
  "X", " ", "O",
  " ", "O", " ",
  " ", " ", "X",
  ]
b.cells = win
binding.pry



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
# "1"