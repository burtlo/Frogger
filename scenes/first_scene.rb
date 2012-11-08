class FirstScene < GameScene

  draw :frog, position: Point.at(320,460,1)
  draw :lanes

  def update
    calculate_if_frog_has_been_hit!
  end

  def calculate_if_frog_has_been_hit!
    lanes.all_traffic.each do |vehicle|
      puts "Frog is hit" if frog.bounds.intersect(vehicle.bounds)
    end
  end

end


class Metro::Units::RectangleBounds

  def intersect(b)
    return not(b.min_x > max_x or b.max_x < min_x or b.min_y > max_y or b.max_y < min_y)
  end

end