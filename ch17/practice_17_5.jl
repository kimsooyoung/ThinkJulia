using Printf
import Base.+

struct Kangaroo
    pouchcontents::Vector{Any}
    function Kangaroo(content::Any = [])
        new(content)
    end
end

function putinpouch(pouch::Kangaroo, anything::Any)
    contents = pouch.pouchcontents
    contents = [contents..., anything]
    Kangaroo(contents)
end

function putinpouch(pouch1::Kangaroo, pouch2::Kangaroo)
    contents = [pouch1.pouchcontents..., pouch2.pouchcontents...]
    Kangaroo(contents)
end

function Base.show(io::IO, kangaroo::Kangaroo)
    @printf(io, "%s", string(kangaroo.pouchcontents))
end

kanga = Kangaroo([1,2,3])
roo = Kangaroo([7,8,9])

output = putinpouch(kanga, roo)
# putinpouch(kanga, roo)
println(output)