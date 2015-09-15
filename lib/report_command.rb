class ReportCommand

  def initialize(robot)
    @robot = robot
  end

  # prints the robot's current position to the standard output, in readable format
  def execute
    puts @robot.report
  end
end
