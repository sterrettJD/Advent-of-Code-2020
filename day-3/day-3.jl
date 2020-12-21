open("day-3-data.txt") do file
    data = [ln for ln in eachline(file)]

    y , x = 1 , 1 #set the starting coordinates
    down, right = 1, 3 #each movement is down 1, right 3
    tree = '#' #had to specify this as a character, not a string because
               #it'll be compared to a character
    treesHit = 0

    while y <= length(data)
        if data[y][x] == tree
            treesHit += 1
            x += right
            y += down
        else
            x += right
            y += down
        end
        #Added in this if stmt because the data repeats to the right,
        #so I need to move the x coordinate one repeatlength back
        if x > length(data[1])
            x -= length(data[1])
        end
    end

    println("Number of trees hit in part 1: ", treesHit)

#PART 2 - did the same thing here, except I looped through the
#various down/right commands that were given.
#This portion wants the product of all trees hit from each method,
#so I take the product of the results array at the bottom

    downs, rights = [1,1,1,1,2], [1,3,5,7,1]
    results = []
    for i in 1:length(downs)
        y , x = 1 , 1
        treesHit2 = 0

        while y <= length(data)
            if data[y][x] == tree
                treesHit2 += 1
                x += rights[i]
                y += downs[i]
            else
                x += rights[i]
                y += downs[i]
            end
            if x > length(data[1])
                x -= length(data[1])
            end
        end
        append!(results, treesHit2)
    end
    println("Product of trees hit for each method in part 2: ",
            prod(results))
end
