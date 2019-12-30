## Objectives
# 1. Build a command-line interface (CLI).
# 2. Create a domain model with multiple relating and collaborating objects.

class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end

end
