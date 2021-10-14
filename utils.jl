using PartialFunctions

function roll(n::Int, xs::AbstractArray)
    if n < 0
        error("n must not be less than 0")
    elseif n > length(xs)
        error("n must not be greater than length of xs")
    end
    (xs[i:i+n-1] for i = 1:(length(xs)-n+1))
end


function roll_apply(func::Function, n::Int, xs::AbstractArray)
    map(func, roll(n, xs))
end


function roll_func(func::Function, n::Int, xs::AbstractArray{T}) where {T}
    offset = n - 1
    nval = length(xs) - offset
    res = zeros(T, nval)
    @inbounds for i = 1:nval
        res[i] = func(view(xs, i:i+offset))
    end
    res
end

