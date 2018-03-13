# Author: Truong Nguyen
## Problem
Write a script or program to solve the following

Problem 1

The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17

Find the sum of all the primes below 2 million.

Problem 2

Which prime, below one million, can be written as the sum of the most consecutive primes?

## Approaches
### Problem 1

The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17

Find the sum of all the primes below 2 million.

=> According on the concept of Prime: https://en.wikipedia.org/wiki/Prime_number

We make a loop to eliminate the multiples of numbers. The rest numbers must be primes. 

### Problem 2
- Which prime?
- Sum of the most consecutive primes?

=> According Euler rules of consecutive primes sum: http://mathworld.wolfram.com/PrimeSums.html

Scenario: 

- Calculating n as the limitation index of primes array.
- Finding the range of index of last prime number in consecutive primes expected
   - From euler_n, we reduce the limitation until get biggest sum under max. This biggest sum can be not a prime.
   - Finding index of primes having biggest sum of primes which is a prime by range (0..new_euler_n). This biggest sum must be a prime
- Finally, assuming that the consecutive primes expected is an array with index in range (begin..end). Thus, prime `begin` index will be in range (0..index - 1) and prime `end` index will be in range (index - 1..new_euler_n). Doing loops to get sum of the most consecutive primes expected.

## Installation
`bundle`: to install ruby gems needed in Gemfile.

## Run program and test

`bundle exec rake`: to show both results of two problems.

`rspec spec`: to run integration test.    