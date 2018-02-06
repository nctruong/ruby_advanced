# https://www.hackerrank.com/challenges/ctci-making-anagrams/problem
# lesson: must cover all test cases
def remove_dup(a,b)
  b.each {|e| a.delete_at(a.index(e)) unless a.index(e).nil?}
  a
end

x  = "fsqoiaidfaukvngpsugszsnseskicpejjvytviya".split(//)
y  = "ksmfgsxamduovigbasjchnoskolfwjhgetnmnkmcphqmpwnrrwtymjtwxget".split(//)
# grant array1 to array2 if array2 changed, array1 changed as well => using dup method.

x1 = remove_dup(x.dup,y.dup)
y1 = remove_dup(y.dup,x.dup)
p x1
p y1
res = x1.size + y1.size
p res