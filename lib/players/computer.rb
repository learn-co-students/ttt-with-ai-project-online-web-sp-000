module Players
  class Computer < Player
  
    WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]]
    
    def initialize(token)
      @token = token
    end

    
    def move(board)
      WIN_COMBINATIONS.each do |x|
        if defeat_opponent?(board, x)
          return choose_defeating_space(board, x)
        end
      end
      WIN_COMBINATIONS.each do |x|
        if block_opponent?(board, x)
          return choose_blocking_space(board, x)
        end
      end
      if check_middle?(board)
        return "5"
      elsif check_corners(board)
        return check_corners(board)
      else
        return choose_empty_space(board)
      end
    end

    def check_corners(board)
      evens = [1, 3, 7, 9].shuffle
      evens.each do |x|
        if !board.taken?(x)
          return x
        end
      end
      false
    end
    
    def block_opponent?(board, array_of_three)
      counter = 0
      array_of_three.each do |x|
        if board.cells[x] != @token && board.cells[x] != " "
          counter += 1
        elsif board.cells[x] == @token
          counter -= 1
        end
      end
      if counter == 2
        return true
      else
        false
      end
    end
    
    def choose_blocking_space(board, array_of_three)
      array_of_three.each do |x|
        if board.cells[x] == " "
          return x + 1
        end
      end
    end
    
    def defeat_opponent?(board, array_of_three)
      counter = 0
      array_of_three.each do |x|
        if board.cells[x] == @token
          counter += 1
        elsif board.cells[x] != @token && board.cells[x] != " "
          counter -= 1
        end
      end
      if counter == 2
        return true
      else
        false
      end
    end
    
    def choose_defeating_space(board, array_of_three)
      array_of_three.each do |x|
        if board.cells[x] == " "
          return x + 1
        end
      end
    end
    
    def choose_empty_space(board)
      empty_space = []
      board.cells.each_with_index do |token, index|
        if token == " "
          empty_space << (index + 1)
        end
      end
      empty_space.shuffle.first
    end
    
    def check_middle?(board)
      board.valid_move?(5)
    end
  end
end
