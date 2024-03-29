# o1
# if questions, ask me to draw it out
function lislength(s)
    
    bioml = [1] #best index of max length
    # so bioml[3] will always have the index to the lowest
    # final number in a 3-length growing subarray

    for i = 2:length(s)

        # finding correct index to update bioml
        j = 1
        while(j <= length(bioml) && s[bioml[j]] < s[i])
            j += 1
        end

        # updating bioml
        if(j > length(bioml))
            push!(bioml, i)
        elseif(s[i] < s[bioml[j]])
            bioml[j] = i
            
        end

    end
    return length(bioml)
end

# printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

# using Test
# @testset "Tester" begin
# 	@test lislength([5,3,3,6,7]) == 3
# 	@test lislength([2,2,2,2]) == 1
# 	@test lislength([100,50,25,10]) == 1
# 	@test lislength([0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15]) == 6
# 	@test lislength([682, 52, 230, 441, 1000, 22, 678, 695, 0, 681]) == 5
# 	@test lislength([441, 1000, 22, 678, 695, 0, 681, 956, 48, 587, 604, 857, 689, 346, 425, 513, 476, 917, 114, 43, 327, 172, 162, 76, 91, 869, 549, 883, 679, 812, 747, 862, 228, 368, 774, 838, 107, 738, 717, 25, 937, 927, 145, 44, 634, 557, 850, 965]) == 12
# end

# println("\nFungerte alt? Prøv å kjør koden i inginious!")
# println("Husk at disse testene ikke alltid sjekker alle edge-cases")
# println("---------------------------------------------------------\n\n")





# o2
function lis(s, mls)
    ml = maximum(mls)
    lis = zeros(Int, ml)
    lastindex = 10000

    for i = ml:-1:1
        list = findall(x-> x==i, mls) #returns all indexes that indicate that the longest substring is i length
        j = length(list)
        while(list[j] >= lastindex) #make sure the correct index
            j -= 1
        end
        lastindex = list[j]
        lis[i] = s[lastindex]

    end
    return lis
end
# langteks = [[988, 217, 509, 729, 294, 1, 704, 115, 497, 405, 452, 100, 690, 523, 131, 726, 703, 632, 694, 58, 90, 622, 241, 310, 90, 88, 72, 517, 856, 537, 224, 312, 10, 672, 90, 403, 358, 624, 919, 777, 898, 260, 796, 284, 918, 743, 562, 869, 140, 482, 13, 60, 427, 723, 452, 165, 487, 613, 870, 143, 28, 11, 779, 663, 150, 745, 786, 22, 588], [1, 1, 2, 3, 2, 1, 3, 2, 3, 3, 4, 2, 5, 5, 3, 6, 6, 6, 7, 2, 3, 6, 4, 5, 3, 3, 3, 6, 8, 7, 4, 6, 2, 8, 4, 7, 7, 8, 9, 9, 10, 5, 10, 6, 11, 9, 8, 11, 5, 8, 3, 4, 8, 9, 9, 6, 10, 11, 12, 6, 4, 3, 12, 12, 7, 13, 14, 4, 11], [1, 58, 90, 241, 310, 312, 358, 427, 452, 487, 613, 663, 745, 786]]

# printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

# using Test
# @testset "Tester" begin
# 	@test lis([5,3,3,6,7],[1, 1, 1, 2, 3]) == [3,6,7]
# 	@test lis([2,2,2,2],[1, 1, 1, 1]) == [2]
# 	@test lis([100,50,25,10],[1, 1, 1, 1]) == [10]
# 	@test lis([0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15],[1, 2, 2, 3, 2, 3, 3, 4, 2, 4, 3, 5, 3, 5, 4, 6]) == [0,2,6,9,11,15]
# 	@test lis(langteks[1],langteks[2])==langteks[3]
# end

# println("\nFungerte alt? Prøv å kjør koden i inginious!")
# println("Husk at disse testene ikke alltid sjekker alle edge-cases")
# println("---------------------------------------------------------\n\n")





# o3
function cumulative(weights)
    rows, cols = size(weights)
    for y in 2:rows
        min = 1000
        for x in 1:cols #find best path to location and add it
            min = weights[y-1, x] #above
            if(x!=1 && min > weights[y-1, x-1]) #above and to the left
                min = weights[y-1, x-1]
            end
            if(x<cols && min > weights[y-1, x+1]) #above and to the right
                min = weights[y-1, x+1]
            end
            weights[y, x] += min
        end
        println()
    end
    return weights
end

# printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

# using Test
# @testset "Tester" begin
# 	@test cumulative([1 1 ; 1 1]) == [1 1 ;2 2]
#     #Dette er samme eksempel som det vist i oppgaveteskten
# 	@test cumulative([3  6  8 6 3; 7  6  5 7 3; 4  10 4 1 6; 10 4  3 1 2;6  1  7 3 9])== [3  6  8  6  3;10 9  11 10 6;13 19 13 7  12;23 17 10 8  9;23 11 15 11 17]
# end


# println("\nFungerte alt? Prøv å kjør koden i inginious!")
# println("Husk at disse testene ikke alltid sjekker alle edge-cases")
# println("---------------------------------------------------------\n\n")




# o4
function backtrack(pathweights)
	rows, cols = size(pathweights)
	retval = []
	
	min = 1
	for x in 1:cols #go through the bottom row, do this separatly as this is the only one where we have to check all of them
		if(pathweights[rows, x] < pathweights[rows, min])
			min = x
		end
	end
	index = min
	push!(retval, (rows, min))
	min = 1000
	for y in rows-1:-1:1 #go through all the other rows
		min = pathweights[y, index]
		di = 0
		if(index>1 && min >= pathweights[y, index-1])
			min = pathweights[y, index-1]
			di = -1
		end
		if(index<cols && min > pathweights[y, index+1])
			min = pathweights[y, index+1]
			di = 1
		end
		index += di
		push!(retval, (y, index))
	end
	return retval
end

# printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

# using Test
# @testset "Tester" begin
# 	@test backtrack([1 1 ; 2 2]) == [(2,1),(1,1)]
#     #Dette er samme eksempel som det vist i oppgaveteskten
# 	@test backtrack([3  6  8  6  3; 10 9  11 10 6; 13 19 13 7  12; 23 17 10 8  9; 23 11 15 11 17]) == [(5,2), (4,3), (3,4), (2,5), (1,5)]
# end

# println("\nFungerte alt? Prøv å kjør koden i inginious!")
# println("Husk at disse testene ikke alltid sjekker alle edge-cases")
# println("---------------------------------------------------------\n\n")