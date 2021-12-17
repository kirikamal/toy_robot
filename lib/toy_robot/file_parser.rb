require 'byebug'

module ToyRobot
  class FileParser
    attr_reader :placer

    def initialize
      table = ToyRobot::Table.new(5, 5)
      @placer = ToyRobot::Placer.new(table)
    end

    def load_commands(commands)
      File.readlines(commands).map do |command|
        ToyRobot::Command.process(command)
      end
    end

    def run(commands)
      commands.each do |command, *args|
        placer.send(command, *args)
      end
    end
  end
end