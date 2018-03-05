# Main program
require "#{Dir.pwd}/config/configuration.rb"

if ARGV.size < 2
  Logger.log_instance.debug Lib::Message::Issue::LACK_FILE_PATH
  Logger.log_instance.debug Lib::Message::Issue::INSTRUCTION
elsif !File.exist?(ARGV.first)
  message = "#{ARGV.first} #{Lib::Message::Issue::FILE_NOT_EXISTED}"
  Logger.log_instance.debug message
elsif !File.exist?(ARGV[1])
  message = "#{ARGV[1]} #{Lib::Message::Issue::FILE_NOT_EXISTED}"
  Logger.log_instance.debug message
else
  solution = Lib::Transaction.new({people_path: ARGV.first, transaction_path: ARGV[1]})
  print solution.results
end
