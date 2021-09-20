using ThinkJulia

🐢 = Turtle()

"""
draw fractal
"""
function draw(t, length, n)
    if n == 0
        return
    end

    angle = 60
    forward(t, length)
    turn(t, -angle)
    draw(t, length, n - 1)
    turn(t, 2 * angle)
    draw(t, length, n - 1)
    turn(t, -angle)
    forward(t, length)
end

@svg begin
    draw(🐢, 10, 3)
end