module ToyRobot
  class Placer
    attr_reader :robot
    
    def initialize(table)
      @table = table
    end

    def place(width, length, facing)
      return unless @table.valid_position?(width, length)

      @robot = Robot.new(width, length, facing)
    end

    def move
      robot.move
    end

    def turn_right
      robot.turn_right
    end

    def turn_left
      robot.turn_left
    end

    def report
      robot.report
    end    
  end
end
