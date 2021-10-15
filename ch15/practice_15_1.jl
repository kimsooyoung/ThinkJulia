mutable struct MPoint
    x
    y
end

function distancebtwpoints(p1, p2)
    return sqrt( (p1.x - p2.x)^2 + (p1.y - p2.y)^2 )
end

p1 = MPoint(0.0, 0.0)
p2 = MPoint(3.0, 4.0)

println(distancebtwpoints(p1, p2))
