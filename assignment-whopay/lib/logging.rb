# Manage logs
# singleton pattern for Logger
class Logger
  attr_reader :instance
  @instance = Logger.new('logs.txt')

  def self.log_instance
    @instance
  end
end
Logger.log_instance.level = Logger::DEBUG
