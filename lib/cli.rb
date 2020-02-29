
require_relative '../config/environment'
require 'pry'

class CLI
    attr_reader :prompt

    def initialize
        @prompt = TTY::Prompt.new
    end

    def kind_of_game
        @prompt.select("What kind of game would you like to play?", %w( 0_player, 1_player, 2_player))
    end


end