module Players
    class Computer < Player
        attr_accessor :random_strategy, :strategies

        def initialize(token)
            @token = token
            @strategies = Game.WIN_COMBINATIONS.shuffle
            @random_strategy = self.strategies.pop
        end

        def move(board)
            # if (board.taken?(self.random_strategy.last + 1) == true || self.random_strategy == [])
            #     random_shot = board.cells.index {|cell| cell == " "}
            #     random_shot += 1
            #     random_shot.to_s
            # elsif (board.taken?(self.random_strategy.last + 1) == false)
            #     puts "Strategy is #{self.random_strategy}"
            #     puts "Trying strategy...."
            #     strategy_num = self.random_strategy.pop
            #     strategy_num += 1
            #     if (strategy_num != nil)
            #         strategy_num.to_s
            #     elsif (strategy_num == nil)
            #         random_shot = board.cells.index {|cell| cell == " "}
            #         random_shot += 1
            #         random_shot.to_s
            #     end
            # else
            if
                random_shot = board.cells.index {|cell| cell == " "}
                random_shot += 1
                random_shot.to_s
            end
        end 
    end
end