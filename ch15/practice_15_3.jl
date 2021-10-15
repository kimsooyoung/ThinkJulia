"""
Circle

center => Point
radius => number
"""

mutable struct Point
    x
    y
end

mutable struct Circle
    center
    radius
end

struct Rectangle
    width
    height
    corner
end

function distance(p1, p2)
    sqrt( (p1.x - p2.x) ^ 2 + (p2.y - p2.y) ^2 ) 
end

function getlistdistances(p_list, point)
    output = []

    for p in p_list
        push!(output, (distance(p, point), p.x, p.y))
    end

    sort!(output)
    output
end

function getrectpoints(rect)
    point1 = rect.corner
    point2 = movepoint(rect.corner, rect.width, 0)
    point3 = movepoint(rect.corner, 0, rect.height)
    point4 = movepoint(rect.corner, rect.width, rect.height)

    [point1, point2, point3, point4]
end

function getlinefrompoints(p1, p2)
    a = (p2.y - p1.y)
    b = (p1.x - p2.x)
    c = (p1.y * -b) - (p1.x * a)

    tuple(a, b, c)
end

function circlelinedistance(circle, line_param)
    (a, b, c) = line_param
    point = circle.center

    abs(a * point.x + b * point.y + c ) / sqrt(a ^ 2 + b ^ 2)
end

function movepoint(p, dx, dy)
    Point(p.x + dx, p.y + dy)
end


function pointincircle(circle, point)
    r_val = (point.x - circle.center.x) ^ 2 + (point.y - circle.center.y) ^ 2
    # @show r_val circle.radius ^ 2

    if r_val ≤ (circle.radius ^2 )
        return true
    else
        return false
    end
end

function rectincircle(circle, rect)
    point_list = getrectpoints(rect)

    for point in point_list
        if !pointincircle(circle, point)
            # @show point
            return false
        end
    end

    true
end

function rectcircleoverlap(circle, rect)
    rect_point_list = getrectpoints(rect)
    distance_list = getlistdistances(rect_point_list, circle.center)

    closest_p1 = Point(distance_list[1][2], distance_list[1][3])
    closest_p2 = Point(distance_list[2][2], distance_list[2][3])
    
    (a, b, c) = getlinefrompoints(closest_p1, closest_p2)

    circle_dist = circlelinedistance(circle, (a, b, c) )

    for point in rect_point_list
        if pointincircle(circle, point)
            return true
        end
    end

    if circle_dist ≤ circle.radius
        return true
    end

    false
end

# practice 15_2

origin = Point(150, 100)
circle = Circle(origin, 75)

println(origin)
println(circle)

# test_point = Point(150, 25)
# println(pointincircle(circle, test_point))

rect = Rectangle(25, 25, Point(125, 125))
println(rectincircle(circle, rect))

rect2 = Rectangle(10, 20, Point(225, 90))
println(rectcircleoverlap(circle, rect2))