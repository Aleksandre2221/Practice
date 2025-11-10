

         # Approach 1. Using - For loop -- 
res = []
for x in accounts:
    res.append(sum(x))
return max(res)


        # Approach 2. Using - list-comprehension -- 
return max(sum(x) for x in accounts)
