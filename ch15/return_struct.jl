mutable struct MPoint
    x
    y
end

struct Point
    x
    y
end

struct Rectangle
    width
    height
    corner
end

function findcenter(rect)
    Point(rect.corner.x + rect.width / 2, rect.corner.y + rect.height / 2)
end

rect = Rectangle(5.0, 10.0, MPoint(0.0, 0.0))
println(findcenter(rect))