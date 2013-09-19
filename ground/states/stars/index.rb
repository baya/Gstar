module Stars
  class Index < Ground::State

    def call
      stars = [{link: 'http://www.github.com', title: 'ground', description: params[:q]}]
      json stars.to_json
    end
    
  end
end
