function distance(x₁, y₁, x₂, y₂)
    dx = x₁ - x₂
    dy = y₁ - y₂
    @show dx dy
    d² = dx^2 + dy^2
    @show d²
    return sqrt(d²)
end

function area(radius)
    a = π * radius^2
    return a
end

function circlearea(xc, yc, xp, yp)
    return area(distance(xc, yc, xp, yp))
end

println(circlearea(0,0,3,4))