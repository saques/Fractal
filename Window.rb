require 'Gosu'
require_relative 'Fractal'

class Window < Gosu::Window

  def initialize
    super(1200, 1200)
    self.caption = Fractal
    @fractal = Fractal.new(600,500,500)
    @needs_redraw = true
  end

  def update
    if Gosu.button_down?(Gosu::KbReturn)
      @fractal.step
      @needs_redraw = true
    elsif Gosu.button_down?(Gosu::KbEscape)
      self.close
    end
  end

  def needs_redraw?
    @needs_redraw
  end

  def draw
    if needs_redraw?
      puts @fractal.squares.size
      col = Gosu::Color.argb(0xff_ff0000)
      for x in @fractal.squares do
        #Gosu.draw_rect(x.pos_x,x.pos_y,x.size,x.size,col)
        Gosu.draw_quad(x.pos_x-x.size/2,x.pos_y+x.size/2,col,x.pos_x+x.size/2,x.pos_y+x.size/2,col,
                       x.pos_x-x.size/2,x.pos_y-x.size/2,col,x.pos_x+x.size/2,x.pos_y-x.size/2,col)
      end
      @needs_redraw = false
    end
  end
end

w = Window.new
w.show

