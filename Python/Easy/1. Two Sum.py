

          # The Best Approach. Using - dictionary --
seen = {}
for i,v in enumerate(nums):
  if target - v in seen:
      return (seen[target - v], i)
  seen[v] = i
            
