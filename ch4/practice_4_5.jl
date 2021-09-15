using ThinkJulia

🐢 = Turtle()

function ploygon(t, len, n)
    for i in 1:n
        forward(t, len)
        turn(t, -360 / n)
    end
end

@svg begin
    ploygon(🐢, 100, 6)
end