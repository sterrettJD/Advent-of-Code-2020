open("day-10-data.txt") do file
    data = sort!([parse(Int,ln) for ln in eachline(file)])
    pushfirst!(data,0)
    append!(data, data[end]+3)

    function jumpsizes(x::Array{Int})
        jump1 = 0
        jump2 = 0
        jump3 = 0

        for i in 2:length(x)
            if x[i]-x[i-1]==1
                jump1 += 1
            elseif x[i]-x[i-1]==2
                jump2 += 1
            elseif x[i]-x[i-1]==3
                jump3 += 1
            end
        end

        return jump1, jump2, jump3
    end

    jump1, jump2, jump3 = jumpsizes(data)
    answer = jump1 * jump3
    flush(stdout)
    println("$jump1 jumps of 1, $jump2 jumps of 2, $jump3 jumps of 3")
    println("The answer is $answer")


    #PART 2


    #I can't take credit for coming up with this solution. See the reddit comment below
    #https://www.reddit.com/r/adventofcode/comments/kabi91/2020_day_10_closedform_mathematical_solution/gf9t47u?utm_source=share&utm_medium=web2x&context=3

    #I got stuck trying to come up with a non-brute force solution, and after
    #looking for help I stumbled on that comment. A pretty intuitive matrix
    #multiplication-based solution. I just removed the elseif d==2 because there
    #are no jumps of 2, as evidenced by part 1.


    diffs = [data[1]; diff(data); 3]
    v = [1;0;0]

    for d = diffs
        if d == 1
            v = [1 1 1;1 0 0;0 1 0]*v
        else
            v = [1 0 0;0 0 0;0 0 0]*v
        end
    end

    p2 = v[1]
    println("There are $p2 different potential sequences")
end
