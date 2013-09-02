require 'bundler'
Bundler.require(:default)

module Gstar
  App = Ground 'gstar' do
    use Rack::ShowExceptions
    use Rack::Static, urls: ['/js', '/css', '/lib', '/partials'], root: 'app'
  end
end
