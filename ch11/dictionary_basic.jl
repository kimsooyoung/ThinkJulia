eng2sp = Dict()

eng2sp["one"] = "two"
println(eng2sp)

eng2sp = Dict("one"=>"uno", "two"=>"dos", "three"=>"tres")
println(eng2sp)

println(eng2sp["three"])
println(length(eng2sp))

ks = keys(eng2sp)
println("one" ∈ ks)

vs = values(eng2sp)
println("uno" ∈ vs)