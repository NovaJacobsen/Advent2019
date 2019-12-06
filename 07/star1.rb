$LOAD_PATH.unshift(File.expand_path("..", __FILE__))

require 'amplifier'

module Day07
  best_setting = [0,1,2,3,4].permutation.max_by do |setting|
    Amplifier.new(setting).amplify
  end

  best_setting  # => [4, 1, 0, 2, 3]
  Amplifier.new(best_setting).amplify  # => 20413
end
