$LOAD_PATH.unshift(File.expand_path("..", __FILE__))

require 'input'
require 'computer07'

module Day07
  class Amplifier
    attr_accessor :setting

    def initialize(settings, program: Day07::Input)
      @settings = settings
      @c = Computer.new(*program)
    end

    def amplify(val=0)
      @settings.each do |phase|
        @c.reset
        @c.input = [val, phase]
        val = @c.run.output.first
      end
      val
    end
  end
end
