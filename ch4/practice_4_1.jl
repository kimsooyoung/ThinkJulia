using ThinkJulia

🐢 = Turtle()

function SimpleSquare()
    @svg begin
        forward(🐢, 100)
        turn(🐢, -90)
        forward(🐢, 100)
        turn(🐢, -90)
        forward(🐢, 100)
        turn(🐢, -90)
        forward(🐢, 100)
        turn(🐢, -90)
    end
end

function ForLoopSquare()
    @svg begin
        for i in 1:4
            forward(🐢, 100)
            turn(🐢, -90)
        end
    end
end

ForLoopSquare()