module GithubAPI
  class ListStarredRepos < Dun::Activity
    include GithubAPI

    def call
      api_get("/users/#{user}/starred")
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
