class Table

  def initialize(length, width)
    @length = length
    @width = width
  end

  def position_is_valid?(position)
    position.x < @length && position.y < @width && position.x >= 0 && position.y >= 0
  end

  private
    def maximum_x
      @length - 1
    end

    def maximum_y
      @width - 1
    end

end
