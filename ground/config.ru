# This file is used by Rack-based servers to start the application.
current_dir = File.expand_path(File.dirname(__FILE__))
$: << current_dir

require 'gstar'
run Gstar::App
