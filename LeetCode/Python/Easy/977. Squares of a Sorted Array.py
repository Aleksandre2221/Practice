

         # Approach 1. Using - list-comprehension -- 
return sorted(x*x for x in nums)


         # Approach 2. Using - For loop -- 
res = [] 
for x in nums:
    res.append(x * x)
return sorted(res)
