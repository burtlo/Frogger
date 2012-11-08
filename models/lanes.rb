class Lanes < Metro::Model

  def update
    lanes.each { |lane| lane.update }
  end

  def draw
    lanes.each { |lane| lane.draw }
  end

  def all_traffic
    t = lanes.map { |lane| lane.vehicles }.flatten.compact
  end

  def number_of_lanes
    12
  end

  def after_initialize
    add_finish_lane
    4.times { add_water_lane }
    add_shoulder_lane
    4.times { add_road_lane }
    add_home_lane
  end

  def window=(window)
    @window = window
    lanes.each { |lane| lane.window = window }
  end

  def add_finish_lane
    add_lane color: "rgb(106,47,146)"
  end

  def add_water_lane
    add_lane color: "rgb(25,76,161)"
  end

  def add_shoulder_lane
    add_lane color: "rgb(127,127,127)"
  end

  def add_road_lane
    lane = add_lane color: "rgb(0,0,0)"
    lane.vehicle = Garage.sample
  end

  def add_home_lane
    add_lane color: "rgb(127,127,127)"
  end

  def add_lane(options)
    defaults = { width: Game.width, height: lane_height, position: Point.at(0,next_lane_y) }
    lane = Lane.new(defaults.merge(options))
    lanes.push lane
    lane
  end

  def lane_width
    Game.width
  end

  def lane_height
    Game.height / number_of_lanes + (Game.height / number_of_lanes / number_of_lanes)
  end

  def next_lane_y
    lanes.count * lane_height
  end

  def lanes
    @lanes ||= []
  end

end
