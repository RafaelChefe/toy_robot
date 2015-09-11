class MoveCommand

  def get_new_position(current_position)
    case current_position.direction
    when 'W'
      Position.new(current_position.x + 1, current_position.y, current_position.direction)
    when 'E'
      Position.new(current_position.x - 1, current_position.y, current_position.direction)
    when 'N'
      Position.new(current_position.x, current_position.y + 1, current_position.direction)
    when 'S'
      Position.new(current_position.x, current_position.y - 1, current_position.direction)
    end
  end

end

