class BouncingBalls

  attr_reader :bounce, :window
  attr_accessor :counter, :height

  def initialize(h, bounce, window)
    @height = h
    @bounce = bounce
    @window = window
    @counter = 1
  end

  def check_variables
    return -1 if (@height.is_a? Numeric) == false
    return -1 if (@bounce.is_a? Numeric) == false
    return -1 if (@window.is_a? Numeric) == false
    return -1 if @height < 0
    return -1 if @bounce >= @height
    return -1 if @bounce > 1
    return -1 if @bounce < 0
    return -1 if @window < 0
    return -1 if @window >= @height
  end

  def bounce_visible?
    bounce_height > window
  end

  def bounce_height
    @height * @bounce
  end

  def count_passes
    while bounce_visible? == true
      @height = bounce_height
      @counter += 2
      puts @height
    end
  end
end

ball = BouncingBalls.new(10, 0.8, 2)


require "pry"; binding.pry
