# Define primitive type 
primitive type Byte 8 end

# Define Constructor of Primitive Type
Byte(val::UInt8) = reinterpret(Byte, val)

b = Byte(0x01)
println(b)