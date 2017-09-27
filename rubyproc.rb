# single proc
def single_argument(proc1)
  proc1.call("Will","Nguyen")
end
proc1 = Proc.new { |firstname, lastname| puts "Hello #{firstname} (#{lastname})"}
single_argument(proc1)

# multiple proc
def multiple_argument(proc_name, proc2, proc3)
  proc2.call(proc_name)
  proc3.call(proc_name)
end
proc2 = Proc.new { |proc_name| puts "This is #{proc_name}"}
proc3 = Proc.new { |proc_name| puts "#{proc_name} want to say hello"}
multiple_argument("proc1", proc2, proc3)

# verify "return" in proc: throw an error if we develop like this
def check_return(proc4)
  proc4.call
  puts "Puts string after return was called"
end
proc4 = Proc.new {
  return false
}
# comment in this line to see what happens
# check_return(proc4)