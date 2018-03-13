# Question: Which prime, below one-million, can be written as the sum of the most consecutive primes
from primesieve import *
from math import *

max = 100
# Generate list of primes under a million
primes_under_million = primes(max)

# Sum of consecutive primes is of order 0.5(n^2)(logn)
# Calculate 'n' so that sum of consecutive primes is less than a million (and not necessarily prime)
nsum = 1
n = 1
while nsum < max:
    nsum = 0.5*(n**2)*(log(n, e))
    n += 1
print("n is: ", n)
# Calculate index so that sum of first 'index' consecutive primes is under a million and also prime
primes_subset = primes_under_million[:n]
print("primes_subset is: ", primes_subset)

nsum = sum(primes_under_million[:n])
while nsum > max:
    n -= 1
    nsum = sum(primes_under_million[:n])
print("n is: ", n)
primes_sum = 0
index = 0
for i in range(len(primes_subset)):
    if i % 2 == 1:
        pass
    else:
        sumprimes = sum(primes_subset[:i])
        if sumprimes > primes_sum and sumprimes < max and sumprimes in primes_under_million:
            primes_sum = sumprimes
            index = i
print("index is: ", index, "n: ", n)
print("i is: ", i)
# Print out sum of consecutive primes till 'index', index, n
# print primes_sum, index, n

# Check consecutive primes within a range (index to n) such that their number is greater than index and maximum
p_end = index + 1
p_begin = 0
subset_start = 0
subset_end = 0
print("index: ", index,"n: ", n)
while p_end <= n:
    while (p_end-p_begin) >= (n-index):
        print("p_end-p_begin: ", p_end-p_begin, ", n-index: ", n-index)
        print("primes_subset[p_begin:p_end]: ", primes_subset[p_begin:p_end])
        sumprimes = sum(primes_subset[p_begin:p_end])
        if sumprimes > primes_sum and sumprimes in primes_under_million:
            primes_sum = sumprimes
            subset_start = p_begin
            subset_end = p_end
        p_begin += 1
    p_end += 1
    p_begin = 0
print(primes_sum)
print( "primes: ", primes_subset[subset_start:subset_end])
print( "sum: ", sum(primes_subset[subset_start:subset_end]))
print( "start", subset_start, "end: ", subset_end)