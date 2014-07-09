class String

  def colour!( log_level )
    replace colour log_level
  end

  def colour( log_level = @colour )
    case log_level
    when Noddy::DEBUG
      @colour = "\e[0;34m" # blue
    when Noddy::INFO
      @colour = "\e[0;32m" # green
    when Noddy::WARNING
      @colour = "\e[0;33m" # yellow
    when Noddy::ERROR
      @colour = "\e[0;31m" # red
    when Noddy::CRITICAL
      @colour = "\e[0;35m" # magenta
    else
      @colour = "\e[0;37m" # white
    end
    @end_colour = "\e[0m"

    @colour + self + @end_colour
  end

  def timestamp!
    replace timestamp
  end

  def timestamp
    if @colour
      @colour + '[' + Time.now.to_s + '] ' + self + @end_colour
    else
      '[' + Time.now.to_s + '] ' + self 
    end
  end

end
