require 'bundler'
Bundler.require

require_all 'lib'

module Players
  class Human < Player

    def move(board)
      input = gets.strip
      input
    end
  end
end
