# function deletehead!(t)
#     popfirst!(t)
# end

# letters = ['a','b','c']
# println(deletehead!(letters))
# println(letters)

# t1 = [1,2]
# t2 = push!(t1, 3)
# println(t1)
# println(t2)

# t1 = [1,2]
# t2 = vcat(t1, 3)
# println(t1)
# println(t2)

function baddeletehead(t)
    t=t[2:end]
end

function tail(t)
    t[2:end]
end

t3 = [1,2,3,4,5]
println(baddeletehead(t3))
println(t3)

letters = ['a','b','c']
println(tail(letters))
println(letters)

