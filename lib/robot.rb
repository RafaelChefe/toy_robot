class Robot

  def initialize
    @table = nil
    @current_position = nil
  end

  attr_reader :table, :position

  def place(table, position)
    @table = table
    @position = position
  end

end
