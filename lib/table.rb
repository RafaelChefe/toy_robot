class Table

  def initialize(length, width)
    @length = length
    @width = width
  end

  def position_is_valid?(position)
    position.x < maximum_x && position.y < maximum_y
  end

  private
    def maximum_x
      @length - 1
    end

    def maximum_y
      @width - 1
    end

end
