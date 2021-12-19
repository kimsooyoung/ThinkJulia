IntOrString = Union{Int64, String}

a = 150::IntOrString
b = "Hello"::IntOrString

@show typeof(a) typeof(b)