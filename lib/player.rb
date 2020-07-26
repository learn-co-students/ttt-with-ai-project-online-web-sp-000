class Player

  attr_reader :token           # attr_reader only creats a reader
                               # attr_writer  ony creates a writer method
  def initialize(token)        # attr_accessor will create both
    @token = token
  end
end

                  
