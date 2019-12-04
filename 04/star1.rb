result = (231832..767346)
  .lazy
  .map(&:to_s)
  .select { |i| i.match?(/^0*1*2*3*4*5*6*7*8*9*$/) }
  .count { |i| i.match?(/(\d)\1/) }

result  # => 1330
