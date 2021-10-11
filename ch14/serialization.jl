using Serialization

io = IOBuffer()
t = [1,2,3]

serialize(io, t)
result = take!(io)
println(result)

t2 = deserialize(IOBuffer(result))
println(t2)

@show t == t2
@show t ≡ t2

# TODO : try JLD2
# https://github.com/JuliaIO/JLD2.jl