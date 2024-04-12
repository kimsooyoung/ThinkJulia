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
    polyline(t, n, step_len, step_angle)
    turn(t,  step_angle / 2)
end

function circle(t, r)
    arc(t, r, 360)
end

function flower(t, r, n)

    step_angle = 360 / n
    
    # Caution!! radian
    r_draw = r / (2 * sin(π / n))
    print(r_draw)

    for i in 1:n
        arc(t, r_draw, step_angle)
        turn(t, step_angle - 180)
        arc(t, r_draw, step_angle)
        
        if n % 2 == 1
            turn(t, 180 / n)
        else
            turn(t, 2 * step_angle - 180)
        end
    end
end

@svg begin
    flower(🐢, 100, 10)
end