# ground_lib = '/Users/jim/Projects/ground/lib'
ground_lib = '/Users/jiangguimin/Projects/ground/lib'
$: << ground_lib

require 'bundler'
Bundler.require(:default)
require 'ground'
require 'logger'
require 'yaml'

require 'config/sets'
require 'states/home'
require 'states/stars/index'
require 'activities/insert_star_from_github'
require 'activities/build_inverted_star_index'
require 'activities/search_stars'
require 'activities/accu_q_star_assoc'
require 'activities/query_stars_by_word'
require 'lib/github_api'
require 'lib/github_api/list_starred_repos'
require 'config/routes'

module Gstar
  DB = Ground.db
  DB.loggers << Ground.logger
  App = Ground 'gStar' do
    use Rack::ShowExceptions
    use Rack::Static, urls: ['/js', '/css', '/lib', '/partials', '/img'], root: "#{Ground.root}/app"
  end
end
