module GithubAPI
  class ListStarredRepos < Dun::Activity
    include GithubAPI

    data_reader :page, :per_page

    def initialize(data)
      super
      default :page, 1
      default :per_page, 100
    end

    def call
      api_get("/users/#{user}/starred?page=#{page}&per_page=#{per_page}")
    end

    private

    def api_get(path)
      url = "#{base_uri}#{path}"
      if access_token
        auth = "token #{access_token}"
      else
        auth = "basic " + Base64.encode64("#{login}:#{password}")
      end
      RestClient.get url, Authorization: auth
    end
    
  end
end
