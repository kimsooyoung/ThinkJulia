using ThinkJulia

🐢 = Turtle()

function square(t)
    for i in 1:4
        forward(t, 100)
        turn(t, -90)
    end
end

@svg begin
    square(🐢)
end