function distance(x₁, y₁, x₂, y₂)
    dx = x₁ - x₂
    dy = y₁ - y₂
    @show dx dy
    d² = dx^2 + dy^2
    @show d²
    return sqrt(d²)
end

d = distance(1,2,3,4)
println("distance is $d")