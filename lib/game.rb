class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS =
      [ [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6] ]

        def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
          @board = board
          @player_1 = player_1
          @player_2 = player_2
        end
    
        def current_player
          if self.board.turn_count.even?
            return @player_1
          end
            @player_2
        end

        def won?
          array_two = []
          i = 0
          WIN_COMBINATIONS.each do |win_combination|
              win_index_1 = win_combination[0]
              win_index_2 = win_combination[1]
              win_index_3 = win_combination[2]
       
              position_1 = board.cells[win_index_1]
              position_2 = board.cells[win_index_2]
              position_3 = board.cells[win_index_3]
       
              i += 1
              if position_1 == ("X") && position_2 == ("X") && position_3 == ("X")
       
       
                array_two << win_combination[0]
                array_two << win_combination[1]
                array_two << win_combination[2]
                array_two.join(",")
       
       
       
               elsif position_1 == ("O") && position_2 == ("O") && position_3 == ("O")
       
       
                 array_two << win_combination[0]
                 array_two << win_combination[1]
                 array_two << win_combination[2]
                 array_two.join(",")
       
       
       
          end
        end
        if array_two != []
        return array_two
        end
        false  
      end
      
          #   if array_two != []
          #     binding.pry
          #     return array_two
          #   else
          #     return false
          #   end
          # end
          # x = []
          # o = []
          #   board.cells.each_with_index do |c, index|
          #   if c == "X"
          #   x << index
          #   elsif c == "O"
          #   o << index
          #   end
          # end
          # WIN_COMBINATIONS.each do |win|
  
          #   if x.include?(win)
          #     binding.pry
          #     return win
          #   elsif o.include?(win)
          #     return win
          #   end
          #   return false
          # end
        # end         


  def draw?
    if !won?
      board.cells.each do |i|
        if i == " "
          return false
        end
        true
      end
    end
    
  end

  def over?
    if draw? || won?
      return true
    end
    false
  end

  def winner
    a = won?
    if a
    b = a[0]
    return board.cells[b]
    end
    nil
  end

   def turn
    a = current_player.move(board)
    if !board.valid_move?(a)
    while !board.valid_move?(a)
      puts "not valid move"
      a = current_player.move(board)
  
    end
  end
  b = current_player
  # binding.pry
   board.update(a, b)
        # binding.pry
  end

  def play
    if over?
      if won?
        puts "Congratulations #{winner}!"
        return
      end
      if draw?
         puts "Cat's Game!"
       return
      end
    else
    turn
    end
    if over?
      if won?
        puts "Congratulations #{winner}!"
        return
      end
      if draw?
        puts "Cat's Game!"
       return
      end
   
    else
      turn
      play
    end
    end

    # def start
# puts "Hello User, welcome to the game that shouldn't be won"
# puts "How many players?"
# players = gets.chomp
# if players == "0"
#     player_1 = Players::Computer
#     player_2 = Players::Computer
# elsif players == "1"
#     player_2 = Players::Computer
# end
# puts "Which player should be first and be X?"
# first = gets.chomp
# if first == "2"
#     player_1, player_2 = player_2, player_1
# end

#   end

#   self.start
 
end

