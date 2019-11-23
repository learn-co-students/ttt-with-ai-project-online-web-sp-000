require_relative '../player.rb'

class Players::Human < Player

  def move(board)
    gets.strip
  end

end
