class ReportCommand

  def initialize(robot)
    @robot = robot
  end

  def execute
    puts @robot.report
  end
end
