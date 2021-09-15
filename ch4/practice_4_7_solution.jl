using ThinkJulia

🐢 = Turtle()

function polyline(t, n, len, angle)
    for i in 1:n
        forward(t, len)
        turn(t, -angle)
    end
end

function polygon(t, len, n)
    angle = 360 / n
    polyline(t, n, len, angle)
end

function arc(t, r, angle)
    arc_len = 2 * pi * r * angle / 360
    n = trunc(arc_len / 3) + 1

    step_len = arc_len / n
    step_angle = angle / n

    polyline(t, n, step_len, step_angle)
end

function circle(t, r)
    arc(t, r, 360)
end

@svg begin
    arc(🐢, 50, 120)
    circle(🐢, 30)
end