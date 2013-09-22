module Stars
  class Index < Ground::State

    set :db, Ground.db

    def call
      scan_q_for_search params[:q]
      stars = find_stars params[:q]
      clear_q_star_assocs params[:q]
      json stars.all.to_json
    end

    private

    def find_stars(q)
      SearchStars q: q
      # db[:stars].grep([:name, :description], "%#{q}%")
    end

    def scan_q_for_search(q)
      q.scan(/\w+/).each {|word|
        stars = QueryStarsByWord(word: word)
        stars.each {|star|
          AccQStarAssoc(star: star, q: q)
        }
      }
    end

    def clear_q_star_assocs(q)
      db[:q_star_assocs].where(q: q).delete
    end

  end
end
