open("day-9-data.txt") do file
    data = [parse(Int,ln) for ln in eachline(file)]

    function isValid(x::Int, y::Array{Int,1})
        """Returns true if this number is valid.
        The number is valid if any 2 of the previous 25
        sum to it."""
        passed = 0
        for j in 1:length(y)
            for k in j+1:length(y)
                if x == y[j] + y[k]
                    passed += 1
                end
            end
        end
        return passed > 0
    end

    for i in 26:length(data)
        #if there are no 2 numbers in the previous 25 that sum to the current
        #one, the current one is not valid
         if isValid(data[i], data[i-25:i-1]) == false
             global invalid_num = data[i] #store this for part 2
             global invalid_index = i     #store this for part 2
             flush(stdout)
             println("The number $invalid_num is not valid")
         end
     end

#PART 2:
    i = 1
    found = false
    while found == false #break once we find it
        for j in i+1:invalid_index
            nums = Array{Int,1}([data[num] for num in i:j])

            if sum(nums) == invalid_num
                flush(stdout)
                println("The encryption weakness is ",
                        minimum(nums) + maximum(nums)) #weakness defined in AoC
                found = true                           #instructions
            end
        end
        i += 1
    end
end
