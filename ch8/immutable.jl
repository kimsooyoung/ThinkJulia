str = "Hello"
# str[1] = 'J'
# => LoadError: MethodError: no method matching setindex!
# (::String, ::Char, ::Int64)

new_str = 'Y' * str[2:end]
println(new_str)