open("day-7-data.txt") do file
  data = Dict()
  for ln in eachline(file)
    key, val = split(ln, " bags contain ")[1], split(ln, " bags contain")[2][1:end-1]
    data[key] = [String(strip(v[1:end-4])) for v in split(val, ",")]
  end

  current_bags = ["shiny gold"]
  total_bags = Array{String,1}()

  while true
    #Initialize a new set of this level of bags
    #until we're no longer adding new bags inside.
    #
    #This is loop breaks when there are no new bags to add inside.

    new_bags = Array{String,1}()

    for bag in current_bags
      for inner_bag in data[bag]
        if inner_bag[1] != 'n' #bags that don't have to contain any inner bags
                               #say "no other" instead of "{number} {color}",
                               #which means end bags start with an 'n'.

          for i in 1:parse(Int,inner_bag[1])    #repeat this process for the
            push!(total_bags, inner_bag[3:end]) #number of that color must be contained
            push!(new_bags, inner_bag[3:end])
          end

        else #DON'T add to new_bags or total_bags if inner_bag == "no other"
          continue
        end
        
      end
    end
    current_bags = new_bags
    if length(current_bags) == 0 #IF there are no inner bags to be added, break!
      break
    end
  end

  println("One single shiny gold bag would have to contain ", length(total_bags),
          " other bags.")
end
