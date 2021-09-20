using ThinkJulia

🐢 = Turtle()


"""
draw Koch Snowflake
"""

function Koch(t, length, n)

    angle = 60

    if length < 3
        forward(t, length)
        return
    end

    Koch(t, length / 3, n - 1)
    turn(t, -angle)
    Koch(t, length / 3, n - 1)
    turn(t, 2 * angle)
    Koch(t, length / 3, n - 1)
    turn(t, -angle)
    Koch(t, length / 3, n - 1)
end

function QuadraticKoch(t, length, n)

    angle = 90

    if length < 3
        forward(t, length)
        return
    end

    QuadraticKoch(t, length / 3, n - 1)
    turn(t, -angle)
    
    QuadraticKoch(t, length / 3, n - 1)
    turn(t, angle)

    QuadraticKoch(t, length / 3, n - 1)
    turn(t, angle)

    QuadraticKoch(t, length / 3, n - 1)
    turn(t, -angle)

    QuadraticKoch(t, length / 3, n - 1)
end

@svg begin
    # Koch(🐢, 300, 4)
    QuadraticKoch(🐢, 300, 4)
end