using ThinkJulia

mutable struct Point
    x
    y
end

mutable struct Circle
    radius
    center
end

struct Rectangle
    width
    height
    corner
end

🐢 = Turtle()

function ploygon(t, len, n)
    for i in 1:n
        forward(t, len)
        turn(t, -360 / n)
    end
end

function drawcircle(t, circle)

    circumstance = 2 * pi * circle.radius

    n = trunc(circumstance / 3) + 3 
    len = circumstance / n

    ploygon(t, len, n)
end

function drawsquare(t, rect)
    move_list = [rect.width, rect.height, rect.width, rect.height]
    for m in move_list
        forward(t, m)
        turn(t, -90)
    end
end

@svg begin
    rect = Rectangle(100, 200, Point(0, 0))
    circle = Circle(100, Point(0, 0))
    # drawsquare(🐢, rect)
    drawcircle(🐢, circle)
end