require_relative 'Square'

class Fractal
  attr_reader :squares

  def initialize(size,x,y)
    @squares = Array.new(1)
    @squares[0]=Square.new(size,x,y)
    @iterations = 0
  end

  def step
    @new_squares = Array.new
    if @iterations % 2 == 0
      @squares.all? do |x|
        @new_squares.concat (x.split(:horizontal))
      end
    else
      @squares.all? do |x|
        @new_squares.concat (x.split(:vertical))
      end
    end
    @squares = @new_squares
    @iterations += 1
  end
end