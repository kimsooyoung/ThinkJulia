struct Point
    x
    y
end

p = Point(1.2, 3.1)
distance = sqrt(p.x^2 + p.y^2)
println("Distance : $(distance)")

try
    p.x = 13
catch e
    println("Error : $(e)")    
end