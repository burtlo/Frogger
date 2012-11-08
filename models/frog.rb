class Frog < Metro::Model

  property :position
  property :angle
  property :image, path: "80sFrogger.png"

  event :on_down, KbLeft do
    self.x -= horizonal_step
  end

  event :on_down, KbRight do
    self.x += horizonal_step
  end

  event :on_down, KbDown do
    self.y += veritical_step
  end

  event :on_down, KbUp do
    self.y -= veritical_step
  end

  def width ; image.width ; end
  
  def height ; image.height ; end

  def bounds
    Bounds.new x: x, y: y, width: width, height: height
  end

  def horizonal_step
    width / 2
  end

  def veritical_step
    height / 2
  end

  def draw
    image.draw_rot(x,y,z_order,angle)
  end

end
