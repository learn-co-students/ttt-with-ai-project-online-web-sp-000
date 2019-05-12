require 'pry'
class Players
  class Computer < Player
    attr_reader :token, :opptoken
    def initialize(token)
      @token = token
      if @token == 'X'
        @opptoken == 'O'
      else
        @opptoken == 'X'
      end
    end
    def move(board)
      if !(self.mewin?(board) == nil)
        self.mewin?(board)
      elsif !(self.oppwin?(board) == nil)
        self.oppwin?(board)
      else
        self.seek_spot(board)
      end
    end
    def row_full?(row)
      row.detect{|e| e == ' '}
    end
    def clone_board(board)
      elegant = board.rows.map do |row|
        row.map do |index|
          board.cells[index]
        end
      end
      elegant
    end
    def mewin?(board)
      elegant = self.clone_board(board)
      xrows = elegant.map do |row|
          row.count {|e| e == self.token}
      end
      if xrows.include?(2)
        index = xrows.find_index(2)
        two_row = elegant[index]
        if !(row_full?(two_row)==nil)
          return_index = two_row.find_index(' ')
          position = rows[index][return_index]
          position += 1
        end
      end
      nil
    end
    def oppwin?(board)
      elegant = clone_board(board)
      xrows = elegant.map do |row|
          row.count {|e| e == self.opptoken}
      end
      if xrows.include?(2)
        index = xrows.find_index(2)
        two_row = elegant[index]
        if !(row_full?(two_row)==nil)
          return_index = two_row.find_index(' ')
          position = rows[index][return_index]
          position += 1
        end
      end
      nil
    end
    def check_corners (board)
      corners = [1, 3, 7, 9]
      open_index = corners.find_index do |input|
        board.valid_move?(input)
      end
      if !(open_index == nil)
        corners[open_index]
      else
        nil
      end
    end
    def seek_spot(board)
      spots = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      if board.valid_move?(5)
        5
      elsif !(check_corners(board)==nil)
        check_corners(board)
      else
        index = spots.find_index do |spot|
        board.valid_move?(spot)
        end
        spots[index]
      end
    end
  end
end
