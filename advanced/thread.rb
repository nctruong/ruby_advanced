@stop = false

thr = Thread.new {
  puts "Counting thread starting..."
  i = 0

  loop {
    i += 1
    puts i
    sleep 1
    break if @stop
  }

  puts "Counting thread exit..."
}

loop {
  puts "\nWaiting for input...\nType 'stop' to exit..."
  input = gets.chomp

  if input == "stop"
    puts "Stopping..."
    @stop = true
    break
  end
}

# Wait for counting thread to end
thr.join
puts "Main program exit..."