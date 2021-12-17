module ToyRobot
  class Table
    def initialize(width = 5, length = 5)
      @width = width
      @length = length
    end

    def valid_position?(width, length)
      (0...@width).cover?(width) && (0...@length).cover?(length)
    end
  end
end
