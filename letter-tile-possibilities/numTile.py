import collections, math

tiles = "AABBC"
freq = collections.Counter(tiles)
prod = 1
for f in freq.values():
    prod *= f + 1
    
res = 0
for i in range(1, prod):
    digits = []
    for f in freq.values():
        digits.append(i % (f + 1))
        i = i // (f + 1)
    print(digits)
    tmp = math.factorial(sum(digits))
    for d in digits:
        tmp //= math.factorial(d)
    res += tmp

print(res)
