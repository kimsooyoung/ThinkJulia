using ThinkJulia

🐢 = Turtle()

function MoveAndTurn(t, len, angle)
    forward(t, len)
    turn(t, angle)
end

function poly(t, r, n)
    for i in 1:n
        MoveAndTurn(t, r, -(90 + 180 / n))
        MoveAndTurn(t, 2 * r * sin(π / n ), -(90 + 180 / n))
        MoveAndTurn(t, r, (720 / n - 180))
    end
end

@svg begin
    poly(🐢, 100, 10)
end