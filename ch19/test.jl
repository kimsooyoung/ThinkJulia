import Printf 
import Base.show

abstract type Animal  end

struct Cat <: Animal
    cry::String
    name::String

    function Cat(cry::String, name::String)
        @assert(cry isa String, "Cry Should be a string")
        @assert(name isa String, "Name Should be a string")
        new(name, cry)
    end
end

function Base.show(io::IO, cat::Cat)
    print(io, "My name isa $(cat.name) and I'm cry like $(cat.cry)")
end

cat = Cat("kitti", "meow")
print(cat)