using ThinkJulia

🐢 = Turtle()

function square(t, len)
    for i in 1:4
        forward(t, len)
        turn(t, -90)
    end
end

@svg begin
    square(🐢, 300)
end