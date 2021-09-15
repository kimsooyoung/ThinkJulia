using ThinkJulia

🐢 = Turtle()

function ploygon(t, len, n)
    for i in 1:n
        forward(t, len)
        turn(t, -360 / n)
    end
end

function circle(t, r)

    circumstance = 2 * pi * r
    # My Answer
    # n = trunc(Int32, circumstance / 5) + 1 
    
    # Book Answer
    n = trunc(circumstance / 3) + 3 
    len = circumstance / n

    ploygon(t, len, n)
end

@svg begin
    circle(🐢, 50)
end