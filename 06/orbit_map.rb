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
    distance_to_com(@orbit[center], current_distance: current_distance + 1)
  end

  def total_distance_to_com
    @orbit.keys.map(&method(:distance_to_com)).sum
  end

  def highest_common_orbit(a,b)
    return a if a == b
    da = distance_to_com(a)
    db = distance_to_com(b)
    if da < db
      highest_common_orbit(a, @orbit[b])
    else
      highest_common_orbit(b, @orbit[a])
    end
  end
end

