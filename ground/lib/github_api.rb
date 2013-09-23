module GithubAPI
  CONFIG = YAML.load_file("#{Ground.root}/ground/config/github.yml")
  
  def self.included(base)
    base.class_eval do
      set :base_uri, 'https://api.github.com'
      set :access_token, CONFIG['access_token']
      set :login, CONFIG['login']
      set :password, CONFIG['password']
      set :user, CONFIG['login']
    end
  end
end
