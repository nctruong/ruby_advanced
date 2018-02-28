<h1> Solution</h1>

**Step#1.** Calculating the total paid amount of each person.<br>
**Step#2.** Calculating the average of amount.<br>
**Step#3.** Calculating the balance amount of each person based on average amount.<br>
**Step#4.** People who has negative balance will pay to people who has positive balance. A person who has biggest negative balance will pay to person who has biggest positive balance.<br>

**For example let's start with simple case.**<br>
There are two people: David and Claire.<br>
- David paid $5 for something. 
- David paid $2 for something. 
- Claire paid $3 for something.
<br><br>
=> **Step#1**
- David paid total $7 for something.
- Claire paid total $3 for something.
<br><br>
=> **Step#2**
Average = (7+3)/2 = 5
<br><br>
=> **Step#3**
We calculate the balance based on this average amount:
- David: (total $7 - $5 average) = 2
- Claire: (total $3 - $5 average) = -2 
<br><br>
=> **Step#4**
Now the balance of Claire is negative so that Claire has to pay to David: <br>
(-2) + 2 = 0
<br>
**=> Claire pays $2 to David.**

<h1>Setup</h1>
- Ruby: version 2.3.3<br>
- Rspec gem for testing<br>
- Byebug gem for debugging<br>
Let's check this out if you don't know how to install ruby <a href="https://github.com/rbenv/rbenv">https://github.com/rbenv/rbenv</a><br>
From command line, go to Mavericks folder(root folder) and run:<br>
<pre>bundle install</pre> to install above gems.

<h1>Perform Unit Test</h1>
There are two files:<br>
- spec/transaction_spec.rb<br>
- spec/transaction_logic_spec.rb<br>

**Run test file**:<br>
Going to spec directory and run these commands one by one.<br>
 - rspec transaction_spec.rb<br>
 - rspec transaction_logic_spec.rb<br>
<br>
Results should be like this:<br>
<pre>
➜  spec git:(master) ✗ rspec transaction_spec.rb 
.............

Finished in 0.01216 seconds (files took 0.14478 seconds to load)
13 examples, 0 failures
</pre>
<br>And
<pre>
➜  spec git:(master) ✗ rspec transaction_logic_spec.rb
....

Finished in 0.01018 seconds (files took 0.14197 seconds to load)
4 examples, 0 failures
</pre>
<br>
I provided 4 test cases in spec/test_cases corresponding with:<br>
- In case all people paid.<br>
- In case Claire not paid.<br>
- In case all amount with decimals.<br>
- In case you provided data.<br>

For each folder case1, case2, case3 and case4, I put expected_result.txt file to explain the logic.

<h1>Main Program</h1>
Make sure you installed ruby already. 
Run program by<br>
<pre>ruby solution.rb "people.text" "transaction.txt"</pre>
Note that people.txt and transaction.txt are two input files. <br>
Results should be like this.<br>
<pre>
Alice pays $89.31 to David.
Alice pays $55.96 to Claire.
Alice pays $33.11 to Bob.
</pre>
If you want to change the test case please go to Mavericks (root) folder to edit these files "people.txt" and "transaction.txt".