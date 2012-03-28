#!/usr/bin/env ruby

require 'irb'
require 'irb/completion'

Dir[File.dirname(__FILE__)+"/console/*.rb"].each {|file| require file}

@session = Console::Session.new
@client  = Console::Client.new(@session)

IRB.start
