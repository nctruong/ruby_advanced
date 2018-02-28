require './transaction.rb'

if ARGV.size < 2
  p "Lacking of file path"
  p "Example: ruby solution.rb 'people.txt' 'transaction.txt'"
else
  case false
    when File.exist?(ARGV.first)
      p "#{ARGV.first} file not existed"
    when File.exist?(ARGV[1])
      p "#{ARGV[1]} file not existed"
    else
      solution = Transaction.new(ARGV.first,ARGV[1])
      print solution.results
  end
end



