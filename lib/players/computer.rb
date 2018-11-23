require_relative "../player.rb"

module Players
	class Computer < Player
		def move(board)
			center_move(board) ||
				second_move(board) ||
				third_move(board) ||
				trapping_move(board) ||
				winning_move(board) ||
				blocking_move(board) || 
				random_move(board)
		end

		def center_move(board)
			if board.valid_move?("5")
				"5"
			end
		end

		def second_move(board)
			if board.turn_count == 1 && board.valid_move?("1")
				"1"
			end
		end

		def third_move(board)
			if board.turn_count == 2
				["1", "3", "7", "9"].find do |move|
					board.valid_move?(move)
				end
			end
		end

		def trapping_move(board)
			corners_taken = board.position(1) == board.position(9) || board.position(3) == board.position(7)
			if board.turn_count == 3 && corners_taken && board.valid_move?("2")
				"2"
			end
		end

		def winning_move(board)
			check_winner(board, board.current_token)
		end

		def blocking_move(board)
			token = board.current_token == "X" ? "O" : "X"
			check_winner(board, token)
		end

		def random_move(board)
			Board::MOVES.shuffle.find {|move| board.valid_move?(move)}
		end

		def check_winner(board, token)
			board.open_positions.find do |position|
				would_win?(board, token, position)
			end
		end

		def would_win?(board, token, position)
			cells = board.cells.dup
			cells[position.to_i - 1] = token
			Game.won?(cells)
		end
	end
end