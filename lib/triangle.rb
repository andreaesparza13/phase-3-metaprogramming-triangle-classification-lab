class Triangle
  attr_accessor :a, :b, :c
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end
  def kind
    validate_triangle
    if a == b && a == c
      :equilateral
    elsif a == b || a == c || b == c
      :isosceles
    else
      :scalene
    end
  end

  def valid_sides?
    [a, b, c].all?(&:positive?)
  end

  def triangle_inequality?
    a + b > c && b + c > a && a + c > b
  end

  def validate_triangle
    raise TriangleError unless triangle_inequality? && valid_sides?
  end

  class TriangleError < StandardError
  end
end
