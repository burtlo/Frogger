class Lane < Metro::Model

  property :position
  property :dimensions
  property :color

  property :height
  property :width

  def vehicles ; [ vehicle ] ; end

  attr_accessor :vehicle

  def window=(window)
    @window = window
    vehicle.window = window if vehicle
  end

  def fix_vehicle_position
    vehicle.x = rand(width)
    vehicle.y = y + vehicle.height/2
  end

  def vehicle_placed? ; @vehicle_placed ; end

  def draw
    window.draw_quad 0, y, color,
      width, y, color,
      width, y + height, color,
      0, y + height, color

    vehicle.draw if vehicle
  end

  def update
    # this is a hack that needs to be called because the height of the vehicle is
    # not known until the window is added to the vehicle.
    if vehicle
      unless vehicle_placed?
        fix_vehicle_position
        @vehicle_placed = true
      end

      vehicle.update
    end
  end

end
