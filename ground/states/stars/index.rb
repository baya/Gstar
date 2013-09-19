module Stars
  class Index < Ground::State

    def call
      res = GithubAPI::ListStarredRepos()
      json res
    end
    
  end
end
