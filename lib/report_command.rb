class ReportCommand

  def initialize(robot)
    @robot = robot
  end

  def execute
    puts report
  end

  private
    def report
      if @robot.not_placed?
        'robot not in place'
      else
        "#{@robot.current_position.x}, #{@robot.current_position.y}, #{@robot.current_position.direction}"
      end
    end
end
