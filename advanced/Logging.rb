require 'logger'
class Logger
  @@instance = Logger.new(STDOUT)
  def self.instance
    @@instance
  end
  module Severity
    # Redefine Constant by using self.class:: syntax
    self.class::DEBUG = 0
    self.class::INFO = 1
    self.class::WARN = 2
    self.class::ERROR = 3
    self.class::FATAL = 4
    WILL = 5
    self.class::UNKNOWN = 6
  end
  def level=(severity)
    if severity.is_a?(Integer)
      @level = severity
    else
      _severity = severity.to_s.downcase
      case _severity
        when 'debug'.freeze
          @level = DEBUG
        when 'info'.freeze
          @level = INFO
        when 'warn'.freeze
          @level = WARN
        when 'error'.freeze
          @level = ERROR
        when 'fatal'.freeze
          @level = FATAL
        when 'will'.freeze
          @level = WILL
        when 'unknown'.freeze
          @level = UNKNOWN
        else
          raise ArgumentError, "invalid log level: #{severity}"
      end
    end
  end
  def will_log(progname = nil, &block)
    add(WILL, nil, progname, &block)
  end
end

Logger.instance.level = Logger::DEBUG
Logger.instance.will_log "Will"
Logger.instance.info "Info"
Logger.instance.error "Error"
Logger.instance.debug("ABC"){ "Rejected: ABX" }



