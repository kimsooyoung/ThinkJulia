# My Answer about 4-7

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

"""
arc(t, r, angle)

주어진 반지름과 각도를이용해 원호를 그린다.

    t: 거북이
    r: 반지름
    angle: 중심각 (단위는 도)
"""

function arc(t, r, angle)
    arc_len = 2 * π * r * abs(angle) / 360
    n = trunc(arc_len / 4) + 3

    step_len   = arc_len / n
    step_angle = angle / n

    turn(t, -step_angle / 2)
    polyline(t, n, step_len, step_len)
    turn(t,  step_angle / 2)
end

@svg begin
    arc(🐢, 50, 120)
end