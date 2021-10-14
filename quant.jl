function snr(xs::AbstractArray)
    """signal noise ratio"""
    n = xs[1] - xs[end] |> abs
    d = xs |> diff .|> abs |> sum
    n / d
end

function trend_power(xs::AbstractArray)
    """走势力度"""
    n = xs[1] - xs[end] |> abs
    d = xs |> diff .|> abs |> sum
    n^2 / d
end