

class Square
  attr_accessor :pos_x , :pos_y , :size
  def initialize(size,x,y)
    @size = size
    @pos_x = x
    @pos_y = y
  end

  def split(mode)
    @new_size = size/2
    @quarter = size/4
    @ans = Array.new(4)

    @ans[0]=Square.new(@new_size,pos_x-@quarter,pos_y+@quarter)
    @ans[1]=Square.new(@new_size,pos_x+@quarter,pos_y+@quarter)
    @ans[2]=Square.new(@new_size,pos_x-@quarter,pos_y-@quarter)
    @ans[3]=Square.new(@new_size,pos_x+@quarter,pos_y-@quarter)

    if mode == :horizontal
      @ans[1].pos_x -= @size
      @ans[2].pos_x += @size
    elsif mode == :vertical
      @ans[0].pos_y -= @size
      @ans[3].pos_y += @size
    else
      raise ArgumentError
    end
    @ans
  end
end