#!/usr/bin/env ruby

require 'irb'
require 'irb/completion'
require 'yaml'
require 'pp'

require 'dropbox_sdk'

begin
  CONFIG = YAML.load_file("config.yml")
rescue Errno::ENOENT
  abort "Can't find config.yml file"
end

IRB.start
