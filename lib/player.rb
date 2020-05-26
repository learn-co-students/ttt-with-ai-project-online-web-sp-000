class Player

  def initialize(token)
    @token = token
  end

  def token
    @token.freeze
  end

end
