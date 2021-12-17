module ToyRobot
  class Robot
    attr_reader :direction, :north, :east

    DIRECTIONS = ["NORTH", "EAST", "SOUTH", "WEST"]
    
    def initialize(north = 0, east = 0, direction = "NORTH")
      @north = north
      @east = east
      @direction = direction
    end

    def move
      send("move_#{@direction.downcase}")
    end

    def turn_left
      turn(:left)
    end

    def turn_right
      turn(:right)
    end

    def move_north
      @north += 1
    end

    def move_east
      @east += 1
    end

    def move_south
      @north -= 1
    end

    def move_west
      @east -= 1
    end

    def turn(turn_direction)
      index = DIRECTIONS.index(@direction)
      rotations = turn_direction == :right ? 1 : -1
      @direction = DIRECTIONS.rotate(rotations)[index]
    end

    def report
      {
        north: north,
        east: east,
        direction: direction
      }
    end
  end
end