#!/bin/ruby https://www.hackerrank.com/challenges/2d-array/problem
def add_sunglass(i,j)
  sunglass = []
  for x in (i-1..i+1) do
    for  in (j..j+2) do
      sunglass << A[x,y] unless (((x==i-1) || (x==i+1)) && y==j+1)
    end
  end
sunglass
end

def add_sunglasses(arr = [])
  sunglasses = []
  for i in (1..4) do
    for j in (1..4) do
      sunglasses << add_sunglass(i,j)
    end
  end
  sunglasses
end

def max_value(arr)
  arr.collect{|a1| a1.sum }
end

arr = Array.new(6)
for arr_i in (0..6-1)
  arr_t = gets.strip
  arr[arr_i] = arr_t.split(' ').map(&:to_i)
end


