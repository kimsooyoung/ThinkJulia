using ThinkJulia

🐢 = Turtle()

function polyline(t, n, len, angle)
    for i in 1:n
        forward(t, len)
        turn(t, -angle)
    end
end

function arc(t, r, angle)
    arc_len = 2 * π * r * angle / 360
    n = trunc(arc_len / 3) + 1

    step_len = arc_len / n
    step_angle = angle / n

    polyline(t, n, step_len, step_angle)
end

@svg begin
    for i in 1: 200
        arc(🐢, i, 10)
    end
end