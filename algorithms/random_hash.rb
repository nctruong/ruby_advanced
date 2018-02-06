h = {"a"=>1,"b"=>2,"c"=>3}
n = 2
random_keys = h.keys.sample(n)
i = random_keys.each_with_object({}){|m,o| o[m] = h[m]}
p i