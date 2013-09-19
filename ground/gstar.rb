ground_lib = '/Users/jim/Projects/ground/lib'
$: << ground_lib

require 'bundler'
Bundler.require(:default)
require 'ground'

require 'config/sets'
require 'states/home'
require 'states/stars/index'
require 'lib/github_api'
require 'lib/github_api/list_starred_repos'
require 'config/routes'

module Gstar
  App = Ground 'gStar' do
    use Rack::ShowExceptions
    use Rack::Static, urls: ['/js', '/css', '/lib', '/partials', '/img'], root: "#{Ground.root}/app"
  end
end
