class Player

  attr_reader :token    # attr_reader only creats a reader
                        # attr_writer  ony creates a writer method
                        # attr_accessor will create both


  def initialize(token)
    @token = token
  end
end
