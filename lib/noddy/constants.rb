module Noddy

  DEBUG = 5
  INFO = 4
  WARNING = 3
  ERROR = 2
  CRITICAL = 1

  DEFAULT_LEVEL = INFO

  COLOUR_DEFAULT = false

  TIMESTAMP_DEFAULT = true

  OUTPUTS_DEFAULT = [STDERR]

  FILE = '/var/log/' + File.basename($0).gsub(/\.\w+$/, '') + '.log'

end
