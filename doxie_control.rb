require 'rubygems'  
require 'daemons'

Daemons.run('doxied.rb', log_output: true)
