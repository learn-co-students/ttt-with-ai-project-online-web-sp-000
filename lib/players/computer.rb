module Players
  class Computer < Player
    def move(board)
      move = nil
      #if computer goes first, X move
      if not board.taken?(5)
        move = "5"
      #if going second and middle is taken, O move
      elsif board.turn_count == 1
        move = "9"
      #next round, and first move is 5, X move is a corner square
    elsif board.turn_count == 2
      move = [1,3,7,9].detect {|move| !board.taken?(move)}.to_s
      #if going second and middle is taken and also a corner, block!
    elsif board.turn_count == 3 && (board.position(9) == board.position(1) || board.position(3) == board.position(7))
      move = "2" unless board.taken?(2)
      #move ? nil : move = "3"
    else
      Game::WIN_COMBINATIONS.detect do |combo|
        if combo.select {|input| board.position(input + 1) == token}.size == 2 && combo.any? {|input| board.position(input + 1) == " "}
          move = combo. select{|input| !board.taken?(input + 1)}.first.to_i.+(1).to_s
        elsif combo.select{ |i| board.position(i + 1) != " " && board.position(i + 1) != token }.size == 2 && combo.any?{ |i| board.position(i + 1) == " " }
          move = combo.select{ |i| !board.taken?(i + 1) }.first.to_i.+(1).to_s
        end
      end

      move = [1, 3, 7, 9, 2, 4, 6, 8].detect{ |i| !board.taken?(i) }.to_s if move == nil
     end
     move

  end
end
end
