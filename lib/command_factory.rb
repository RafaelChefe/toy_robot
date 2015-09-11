require 'left_command'
require 'right_command'

class CommandFactory

  def get_command(type)
    case type
    when 'LEFT' then LeftCommand.new
    when 'RIGHT' then RightCommand.new
    when 'MOVE' then MoveCommand.new
    else nil
    end
  end

end
