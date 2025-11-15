

         # Approach 1. Using - if-elif-else conditions --
res = []
for x in range(1, n+1):
    if x % 3 == 0 and x % 5 == 0:
        res.append('FizzBuzz')
    elif x % 5 == 0:
        res.append('Buzz')
    elif x % 3 == 0:
        res.append('Fizz')
    else: 
        res.append(str(x))
return res



         # Approach 2. Using - list-comprehension --
return ['FizzBuzz' if i % 3 == 0 and i % 5 == 0 else 'Fizz' if i % 3 == 0 else 'Buzz' if i % 5 == 0 else str(i) for i in range(1, n+1)]
