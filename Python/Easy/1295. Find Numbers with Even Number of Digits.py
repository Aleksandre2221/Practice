

         # Approach 1. Using - list-comprehension -- 
return sum(1 for x in nums if len(str(x)) % 2 == 0 )


        # Approach 2. Using - For loop -- 
res = 0 
for x in nums:
    if len(str(x)) % 2 == 0:
        res += 1
return res
