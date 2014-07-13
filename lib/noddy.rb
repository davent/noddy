require "noddy/version"
require "noddy/constants"
require "noddy/string"

module Noddy
  class << self
    def debug( msg )
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


    def log_level=( level )
      @level = level
    end

    def colour=( colour )
      @colour = colour
    end

    def timestamp=( timestamp )
      @timestamp = timestamp
    end

    def outputs=( outputs = [] )
      @outputs = outputs
    end

    private
    def log_message( msg, level )
      outputs = @outputs || OUTPUTS_DEFAULT

      msg.timestamp! if @timestamp || TIMESTAMP_DEFAULT

      outputs.each do |output|
        case output
        when STDOUT
          if @colour || COLOUR_DEFAULT
            STDOUT.puts msg.colour( level ) if level <= (@level || DEFAULT_LEVEL )
          else
            STDOUT.puts msg if level <= (@level || DEFAULT_LEVEL )
          end
        when STDERR
          if @colour || COLOUR_DEFAULT
            STDERR.puts msg.colour( level ) if level <= (@level || DEFAULT_LEVEL )
          else
            STDERR.puts msg if level <= (@level || DEFAULT_LEVEL )
          end
        when String
          write_log_file( output, msg, level )
        else
          raise "Unknow output type of class #{output.class}"
        end
      end
    end

    def write_log_file( output, msg, level )
      log_dir = File.dirname output
      raise "Log file directory #{log_dir} does not exist" unless Dir.exist? log_dir

      begin
        File.open(output, 'a', 0644) do |f|
          f.flock(File::LOCK_EX)
          f.write msg + "\n"
          f.flush
        end
      rescue Errno::EACCES => e
        raise "Permissioned denided writing to #{output}"
      end
    end

  end
end
