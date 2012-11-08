class Vehicle < Metro::Model

  property :position
  property :image
  property :angle
  property :step, default: 1

  def update
    self.x += step
    if self.x < (0 - width/2)
      self.x = Game.width + width/2
    elsif self.x > (Game.width + width/2)
      self.x = 0 - width/2
    end
  end
  
  def bounds
    Bounds.new x: x, y: y, width: width, height: height
  end

  def height ; image.height ; end
  
  def width ; image.width ; end

  def draw
    image.draw_rot(x,y,z_order,angle)
  end
end
