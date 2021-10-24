using Printf

struct Point
    x::Float64
    y::Float64
    function Point(x_in::Float64, y_in::Float64)
        new(x_in, y_in)
    end
end

function Base.show(io::IO, p_in::Point)
    @printf(io, "(%3.5f,3.5%f)", p_in.x, p_in.y)
end

function Point(p_in::Point)
    Point(p_in.x, p_in.y)
end

my_p = Point(1.2, 2.0)
println(my_p)

