class Robot

  attr_reader :table, :current_position

  def initialize
    @table = nil
    @current_position = nil
  end


  def place(table, position)
    if table.position_is_valid?(position)
      @table = table
      @current_position = position
    end
  end

  def report
    if not_placed?
      'robot not in place'
    else
      "position report: x == #{@current_position.x}, " \
      "y == #{@current_position.y}, " \
      "direction == #{@current_position.direction}"
    end
  end

  private
    def not_placed?
      @table.nil? || @current_position.nil?
    end

end
