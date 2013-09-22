module Stars
  class Index < Ground::State

    set :db, Ground.db

    def call
      stars = find_stars(params[:q])
      json stars.all.to_json
    end

    private

    def find_stars(q)
      # db[:stars].grep([:name, :description], "%#{q}%")
      db[query_star_sql(q)]
    end

    def query_star_sql(q)
      dic = db[:dics].where(word: q).first || {}
      sql = <<-EOF
        select stars.full_name, stars.description, stars.html_url from stars
        join dic_stars on stars.id = dic_stars.star_id
        join dics on dic_stars.dic_id = dics.id
        where dics.id = #{dic[:id]}
        order by dic_stars.tf desc
      EOF
    end

  end
end
