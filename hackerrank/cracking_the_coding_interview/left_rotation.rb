#!/bin/ruby

# https://www.hackerrank.com/challenges/ctci-array-left-rotation/problem
# input: n d
# simple case: d < n

def console_input
  n,k = gets.strip.split(' ')
  @n = n.to_i
  @k = k.to_i
  a = gets.strip
  @arr = a.split(' ').map(&:to_i)
end

def new_pos current_i, gap
  gap > current_i ? (@n - (gap - current_i)) : (current_i - gap)
end

def result
  console_input
  return @arr if @n == 1
  brr = Array.new(@n)
  gap = @k > @n ? @k%@n : @k
  [*0..@n-1].each {|i| brr[new_pos(i, gap)] = @arr[i] }
  brr
end

result.each {|e| print "#{e} " }

# approaches:
# - if k > n ?
# - if gap > current_i
# - can't use swap in the same array because one element can be swapped more than 1 time.
