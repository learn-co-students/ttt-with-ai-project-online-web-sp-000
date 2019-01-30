require 'pry'
module Players
  class Computer < Player 
    def game_board
      @game.board if @game
    end
    
    def move(board)
      if game_board
        input = next_move
        board.display
        puts "Computer chose #{input}"
        puts ''
        board.update(input, self)
      else 
        %w(1 2 3 4 5 6 7 8 9).sample
      end
    end
    
    def next_move
      losses = valid_losses
      move = nil
      if game_board.empty?
        move = [0,2,4,6,8].sample
      elsif losses.empty?
        move = game_board.cells.index(' ')
      else
        triplet = losses.detect { |triplet| valid_four(triplet) || valid_even(triplet) || valid_odd(triplet)  } 
        move = valid_four(triplet) || valid_even(triplet) || valid_odd(triplet)
      end
      move + 1
    end
    
    def valid_losses 
      player = @game.current_player.token
      losses = @game.win_combos.select do |combo| 
        !combo.any? { |square| game_board.index_position(square) == player }
      end
      triage_losses(losses)
    end
    
    def valid_four(loss)
      loss.include?(4) && !game_board.index_taken?(4) ? 4 : nil
    end 
    
    def count_four(loss)
      loss.include?(4) ? 1 : 0 
    end
    
    def valid_even(loss)
      loss.detect do |square|
        square.even? && square != 4 && !game_board.index_taken?(square)
      end
    end 
    
    def count_even(loss)
      loss.count do |square|
        square.even? && square != 4 && !game_board.index_taken?(square)
      end
    end 
    
    def valid_odd(loss)
      loss.detect do |square|
         square.odd? && !game_board.index_taken?(square)
      end
    end
    
    def count_opponent(loss)
      opponent = @game.not_current_player.token
      loss.count { |x| game_board.index_position(x) == opponent }
    end
    
    def triage_losses(losses)
      losses.sort do |a, b|
        [count_opponent(b), count_four(b), count_even(b)] <=> [count_opponent(a), count_four(a), count_even(a)]
      end
    end
    
  end 
end