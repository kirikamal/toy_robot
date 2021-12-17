require_relative "toy_robot/version"
require './lib/toy_robot/robot'
require './lib/toy_robot/table'
require './lib/toy_robot/placer'
require './lib/toy_robot/command'
require './lib/toy_robot/file_parser'

module ToyRobot
  parser = ToyRobot::FileParser.new
 
  # To prevent rspec test case failed
  if ARGV[0] != 'spec'
    commands = parser.load_commands(ARGV[0])
    parser.run(commands)
  end  
end
