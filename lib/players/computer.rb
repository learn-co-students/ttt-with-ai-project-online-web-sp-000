module Players
  class Computer < Player

  def move(board)
<<<<<<< HEAD
      if board.cells[4] == " "
        return "5"
      elsif board.cells[0] == " "
        return "1"
      elsif board.cells[2] == " "
        return "3"
      elsif board.cells[6] == " "
        return "7"
      elsif board.cells[8] == " "
        return "9"
      elsif board.cells[1] == " "
        return "2"
      elsif board.cells[3] == " "
        return "4"
      elsif board.cells[5] == " "
        return "6"
      elsif board.cells[7] == " "
        return "8"
      end
    end
  end
=======
    if board.cells[4] == " "
      "5"
    elsif board.cells[0] == " "
      "1"
    elsif board.cells[2] == " "
      "3"
    elsif board.cells[6] == " "
      "7"
    elsif board.cells[8] == " "
      "9"
    elsif board.cells[1] == " "
      "2"
    elsif board.cells[3] == " "
      "4"
    elsif board.cells[5] == " "
      "6"
    elsif board.cells[7] == " "
      "8"
    end

  end

end
>>>>>>> 97d26f2184d839c8074dfba8176ce5c6433fd5a8
end
