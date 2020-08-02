require 'pry'

module Players
  class Computer < Player 
    
    WIN_COMBINATIONS = [
    [0,1,2],
    [0,3,6],
    [0,4,8],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [3,4,5],
    [6,7,8]
  ]
  
    CAN_WIN = [ 
    ['X', 'X', ' '], 
    ['O', 'O', ' '],
    ['X', ' ', 'X'],
    ['O', ' ', 'O'],
    [' ', 'X', 'X'],
    [' ', 'O', 'O']
    ]
    
    def move(board)
      if !board.taken?(5)
        input = 5
       
      elsif board.turn_count == 1 
        if !board.taken?(1)
          input = 1
        end 
      
      elsif can_win?(board) != false
        combination = can_win?(board)
        combination.each do |index|
          try = index.to_i + 1 
          if !board.taken?(try)
            input = index.to_i + 1
            return input
          end
        end
        
      else
        [1, 3, 7, 9].each do |corner|
          if !board.taken?(corner)
            return corner
          end
        end
        input = [2, 4, 6, 8].sample
        until !board.taken?(input)
            input = [2, 4, 6, 8].sample
          end 
      end
      input
    end
  
    def can_win?(board)
    WIN_COMBINATIONS.each do |combination|
    position = []
      combination.each do |index|
        position << board.cells[index]
      end 
      CAN_WIN.each do |can_win|
        if can_win === position && can_win.include?(self.token)
          return combination
        else
          false
        end
      end
    end
    WIN_COMBINATIONS.each do |combination|
    position = []
      combination.each do |index|
        position << board.cells[index]
      end 
      CAN_WIN.each do |can_win|
        if can_win === position
          return combination
        else
          false
        end
      end
    end
    false
  end 
  
  
  end 
end 



