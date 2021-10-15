mutable struct MPoint
    x
    y
end

"""
Represents a Rectangle.

fields: width, height, corner
"""
struct Rectangle
    width
    height
    corner
end

p = MPoint(1.0, 2.0)
r = Rectangle(10, 10, p)

println(r)