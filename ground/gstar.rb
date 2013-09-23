# ground_lib = '/Users/jim/Projects/ground/lib'
ground_lib = '/Users/jiangguimin/Projects/ground/lib'
$: << ground_lib

require 'bundler'
Bundler.require(:default)
require 'ground'

require 'states/home'
require 'config/routes'
require 'config/sets'

module Gstar
  App = Ground 'gstar' do
    use Rack::ShowExceptions
    use Rack::Static, urls: ['/js', '/css', '/lib', '/partials', '/img'], root: "#{Ground.root}/app"
  end
end
