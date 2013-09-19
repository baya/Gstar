module Stars
  class Index < Ground::State

    set :db, Ground.db

    def call
      stars = find_stars(params[:q])
      json stars.all.to_json
    end

    private

    def find_stars(q)
      db[:stars].grep([:name, :description], "%#{q}%")
    end

  end
end
