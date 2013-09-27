module Star
  class SaveDescription < Ground::State
    set :db, Ground.db

    def call
      db[:stars].where(id: request_payload['id']).update(description: request_payload['description'])
      star = db[:stars].where(id: request_payload['id']).first
      BuildInvertedStarIndex star: star
      json star.to_json
    end

    private
    
    def request_payload
      get_or_set :request_payload do
        request.body.rewind
        JSON.parse request.body.read
      end
    end
    
  end
end
