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

function movepoint!(p, dx, dy)
    p.x += dx
    p.y += dy
    nothing
end

function moverectangle!(rect, dx, dy)
    movepoint!(rect.corner, dx, dy)  
    nothing
end

origin = MPoint(0.0, 0.0)
rect = Rectangle(5.0, 5.0, origin)

println(origin, rect)

movepoint!(origin, 1.0, -1.0)
println(origin)

moverectangle!(rect, 2.0, -2.0)
println(rect)

try
    rect.corner = MPoint(10.0, 10.0)
catch e
    println("Error : $e")
end