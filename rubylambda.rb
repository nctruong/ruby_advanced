# single lambda
def single_argument(lambda1)
  lambda1.call("Will","Nguyen")
end
lambda1 = lambda { |firstname, lastname| puts "Hello #{firstname} (#{lastname})"}
single_argument(lambda1)

# multiple lambda
def multiple_argument(lambda_name, lambda2, lambda3)
  lambda2.call(lambda_name)
  lambda3.call(lambda_name)
end
lambda2 = lambda { |lambda_name| puts "This is #{lambda_name}"}
lambda3 = lambda { |lambda_name| puts "#{lambda_name} want to say hello"}
multiple_argument("lambda1", lambda2, lambda3)

# verify "return" in lambda
def check_return(lambda4)
  lambda4.call
  puts "Puts string after return was called"
end
lambda4 = lambda {
  return
}
check_return(lambda4)