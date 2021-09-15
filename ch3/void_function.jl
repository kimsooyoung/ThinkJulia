# void function return type will be "nothing" which is special type in Julia

a = print("test")
show(a) # nothing

b = typeof(nothing)
print(b) # Nothing

