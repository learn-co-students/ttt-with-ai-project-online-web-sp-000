module Players
    class Computer < Player
        def move(board)
            
            opp = "O"
            if(token == "O") 
                opp = "X"
            end

            # p winningMoves(board, token).length
            #p fork(board)

            if(winningMoves(board, token).length > 0)#win
                puts("Win")
                winningMoves(board, token)[0]
            elsif(winningMoves(board, opp).length > 0)#block
                puts("Block")
                winningMoves(board, opp)[0]
            elsif(fork(board) != nil)
                puts("Fork")
                (fork(board) + 1).to_s
            elsif(board.cells[4] == " ")#center
                puts("Center")
                "5"
            else
                puts("Random")
                r = random_open(board)
                r.to_s
            end

        end

        # Win: If the player has two in a row, they can place a third to get three in a row.
        # Block: If the opponent has two in a row, the player must play the third themselves to block the opponent.
        # Fork: Create an opportunity where the player has two ways to win (two non-blocked lines of 2).
        # Blocking an opponent's fork: If there is only one possible fork for the opponent, the player should block it. Otherwise, the player should block all forks in any way that simultaneously allows them to create two in a row. Otherwise, the player should create a two in a row to force the opponent into defending, as long as it doesn't result in them creating a fork. For example, if "X" has two opposite corners and "O" has the center, "O" must not play a corner in order to win. (Playing a corner in this scenario creates a fork for "X" to win.)
        # Center: A player marks the center. (If it is the first move of the game, playing on a corner gives the second player more opportunities to make a mistake and may therefore be the better choice; however, it makes no difference between perfect players.)
        # Opposite corner: If the opponent is in the corner, the player plays the opposite corner.
        # Empty corner: The player plays in a corner square.
        # Empty side:

        def winningMoves(board, token)
            wm = []
            Game::WIN_COMBINATIONS.each do |cmb|
                if(board.cells[cmb[0]] == token && board.cells[cmb[1]] == token && board.cells[cmb[2]] == " ")
                    wm << (cmb[2]+1).to_s
                end
                if(board.cells[cmb[0]] == " " && board.cells[cmb[1]] == token && board.cells[cmb[2]] == token)
                    wm << (cmb[0]+1).to_s
                end
                if(board.cells[cmb[0]] == token && board.cells[cmb[1]] == " " && board.cells[cmb[2]] == token)
                    wm << (cmb[1]+1).to_s
                end
            end
            wm
        end

        def first_open_space(board)
            board.cells.each_with_index {|value, index|
                if(value == " ")
                    return (index + 1).to_s
                end
            }
        end

        def random_open(board)
            open_indexes = []
            board.cells.each_with_index {|value, index|
                if(value == " ")
                    open_indexes << index
                end
            }
            open_indexes.sample. + 1
        end

        def open_indexes(board)
            open_indexes = []
            board.cells.each_with_index {|value, index|
                if(value == " ")
                    open_indexes << index
                end
            }
            open_indexes
        end

        def fork(board)
            fork_play = nil
            oi = open_indexes(board)
            oi.each{|play_index| 
                board.cells[play_index] = token
                if(winningMoves(board, token).length > 1)
                    fork_play = play_index
                end
                board.cells[play_index] = " "
            }
            fork_play
        end
        
    end
end