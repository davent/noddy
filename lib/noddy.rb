require "noddy/version"
require "noddy/constants"
require "noddy/string"

module Noddy
  class << self
    def log_level=( level )
      @level = level
    end

    def log_message( msg )
      level = @level || DEFAULT_LEVEL
    end

    def self.debug( msg )
      log_message( msg, DEBUG )
    end

    def info( msg )
      log_message( msg, INFO )
    end

    def warning( msg )
      log_message( msg, WARNING )
    end

    def error( msg )
      log_message( msg, ERROR )
    end

    def critical( msg )
      log_message( msg, CRITICAL )
    end


    def colour=( colour )
      @colour = colour
    end

    def timestamp=( timestamp )
      @timestamp = timestamp
    end

    private
    def log_message( msg, level )

      msg.colour!( level ) if @colour || COLOUR_DEFAULT

      msg.timestamp! if @timestamp || TIMESTAMP_DEFAULT

      puts msg if level <= @level
    end
  end
end
