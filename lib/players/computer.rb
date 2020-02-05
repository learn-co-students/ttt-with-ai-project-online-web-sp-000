module Players
  class Computer < Player

    def move(board)
      "5"
      if board.cells[0]==" "
        "1"
      elsif board.cells[1]==" "
        "2"
      elsif board.cells[2]==" "
        "3"
      elsif board.cells[3]==" "
        "4"
      elsif board.cells[4]==" "
        "5"
      elsif board.cells[5]==" "
        "6"
      elsif board.cells[6]==" "
        "7"
      elsif board.cells[7]==" "
        "8"
      elsif board.cells[9]==" "
        "9"
    end
  end

  end
end

#input=
#cells[input-1]="O"
#cells[4]="X"
#if input==1
#  cells[1]="X"
#elsif input!=8 && cells[2]==" " && cells[3]==" " && cells[5]==" " && cells[6]==" " && cells[8]==" "
#  cells[7]="X"
#elsif input==8 && cells[2]==" " && cells[3]==" " && cells[5]==" " && cells[6]==" " && cells[8]==" "
#  cells[3]="X"
#elsif input!=6
#  cells[5]="X"
#elsif input==6
#  cells[2]="X"
#elsif input==7
#  cells[9]="X"
#elsif input==9
#  cells[7]="X"
#end
