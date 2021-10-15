mutable struct MPoint
    x
    y
end

struct Point
    x
    y
end

struct Rectangle
    width
    height
    corner
end

p = MPoint(1.0, 0.0)

try
    p.z = 10.0 
catch e
    println("Error : $e")
end

println("typeof(p) : $(typeof(p))")
println("p isa MPoint : $(p isa MPoint)")

println("fieldnames of MPoint : $(fieldnames(MPoint))")
println("Is x is defined in p? : $(isdefined(p, :x))")