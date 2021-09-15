# My Answer about 4-7

using ThinkJulia

🐢 = Turtle()

function ploygon(t, len, n, x)
    for i in 1:x
        forward(t, len)
        turn(t, -360 / n)
    end
end

function arc(t, r, angle)

    circumstance = 2 * pi * r
    n = trunc(Int32, circumstance / 5) + 1 
    x = (n * angle) / 360

    ploygon(t, 5, n, x)
end

@svg begin
    arc(🐢, 50, 120)
end