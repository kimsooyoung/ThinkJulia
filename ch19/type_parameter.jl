struct Point{T<:Real} 
    x::T
    y::T
end

a = Point(0.0, 0.0)
b = Point(1, -1)

# forcing Float type
c = Point{Float64}(1, -1)

@show a b c