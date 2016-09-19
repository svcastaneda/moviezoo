#!/usr/bin/env ruby

commands = [
  'be rake db:drop',
  'be rake db:create',
  'be rake db:migrate',
  'bin/rake test test/'
]

commands.each do |command|
  system("#{command} > /dev/null 2>&1")
end
