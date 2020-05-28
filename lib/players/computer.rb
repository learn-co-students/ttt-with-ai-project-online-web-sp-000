module Players
    class Computer < Player
        def move(board)
           array = board.cells.map do |e|
            if board.valid_move?(e)
                e
            end
        end
        
                #  (1..9).to_a.sample.to_s
        moves = {
            :top_left => "1",
            :top_right => "3",
            :center => "5",
            :bottom_left => "7",
            :bottom_right => "9",
            :mid_upper => "2",
            :mid_left => "4",
            :mid_right => "6",
            :mid_lower => "8"
        }
    
    corners = moves[:top_left], moves[:top_right], moves[:bottom_left], moves[:bottom_right]
    middles = moves[:mid_upper], moves[:mid_lower], moves[:mid_right], moves[:mid_left]
     if board.valid_move?(moves[:center])
        # binding.pry
       return moves[:center]
     end
    if board.turn_count < 2
       return corners.sample
    end
    binding.pry
    a = (1..9).to_a.sample.to_s

    #         a =   moves[:middle]
    #     #    binding.pry
    #         return "4"
    #  end
    # else
    #     a = (1..9).to_a.sample.to_s
    #     binding.pry
    # end
    # a
    # elsif board.turn_count < 2
    #     return corners.sample
     
    #     else 
    #         moves.sample     
    #     end       
        end
    end
end