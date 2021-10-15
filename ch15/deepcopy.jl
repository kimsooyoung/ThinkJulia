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

p1 = MPoint(0.0, 0.0)
p2 = deepcopy(p1)

@show p1 == p2
@show p1 === p2

p3 = Point(1.0, 1.0)
p4 = deepcopy(p3)

@show p3 == p4
@show p3 === p4

# p1 == p2 = false
# p1 === p2 = false
# p3 == p4 = true
# p3 === p4 = true
