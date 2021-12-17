module ToyRobot
  class Placer
    attr_reader :robot
    
    def initialize(table)
      @table = table
    end

    def place(east, north, facing)
      return unless @table.valid_position?(east, north)

      @robot = Robot.new(east, north, facing)
    end

    def move
      return unless robot_placed?
      return unless @table.valid_position?(*robot.next_move)

      robot.move
    end

    def turn_right
      return unless robot_placed?
      robot.turn_right
    end

    def turn_left
      return unless robot_placed?
      robot.turn_left
    end

    def report
      return unless robot_placed?

      position = robot.report
      puts "Robot's current position is: #{position[:east]},#{position[:north]},#{position[:direction]}"
    end

    def invalid(command)
      puts "#{command.strip} is an invalid command"
    end

    def robot_placed?
      !robot.nil?
    end
  end
end
