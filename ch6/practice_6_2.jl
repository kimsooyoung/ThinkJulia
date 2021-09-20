function hypotenuse(width, height)
    w² = width^2
    h² = height^2
    @show w² h²
    output = sqrt(w² + h²)

    return output
end

h = hypotenuse(3,4)
println(h)