class OrbitMap
  def initialize(*orbits)
    @orbit = {}
    orbits.each do |str|
      center, satelite = str.split(')')
      @orbit[satelite] = center
    end
  end

  def distance_to_com(center, current_distance: 0)
    return current_distance if center == 'COM'
    distance_to_com(@orbit[center], current_distance: current_distance +1)
  end

  def total_distance_to_com
    @orbit.keys.map(&method(:distance_to_com)).sum
  end
end

