abstract type PingPongParent end

struct Ping <: PingPongParent
    pong :: PingPongParent
end

function Base.show(io::IO, ping::Ping)
    print(io, ping.pong)
end

# Difference btw Array & Vector
# https://stackoverflow.com/questions/61171531/difference-between-array-and-vector
struct Pong <: PingPongParent
    pings :: Array{Ping, 1}
    function Pong(pings=Array{Ping,1}())
        new(pings)
    end
end

function Base.show(io::IO, pong::Pong)
    for ping in pong.pings
        print(io, ping)
    end
end

function addping(pong::Pong, ping::Ping)
    push!(pong.pings, ping)
    nothing
end

pong = Pong()
ping = Ping(pong)
addping(pong, ping)
