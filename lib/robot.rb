class Robot

  attr_reader :table, :current_position
  attr_accessor :current_position

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

  def short_report
    if not_placed?
      'not in place'
    else
      "#{@current_position.x}, #{@current_position.y}, #{@current_position.direction}"
    end
  end

  def execute(command)
    unless not_placed?
      new_position = command.get_new_position(@current_position)

      @current_position = new_position if @table.position_is_valid?(new_position)
    end
  end

  def not_placed?
    @current_position.nil?
  end
end
