using Printf
import Base.+

struct Point
    x::Float64
    y::Float64
    function Point(x_in::Float64, y_in::Float64)
        new(x_in, y_in)
    end
end

function Base.show(io::IO, p_in::Point)
    @printf(io, "(%3.5f,%3.5f)", p_in.x, p_in.y)
end

function Point(p_in::Point)
    Point(p_in.x, p_in.y)
end

function +(p1::Point, p2::Point)
    Point(p1.x + p2.x, p1.y + p2.y)
end

function +(p::Point, offset::Tuple{Float64, Float64})
    Point(p.x + offset[1], p.y + offset[2])
end

my_p = Point(1.2, 2.0)
println(my_p)

println(my_p + my_p)
println(my_p + (1.0, 1.0))

