# -*- coding: utf-8 -*-
module Stars
  class Index < Ground::State

    set :db, Ground.db
    set :limit, 10

    def call
      scan_q_for_search params[:q]
      stars = find_stars params[:q]
      stars = stars.limit(limit, params[:start].to_i).all
      clear_q_star_assocs params[:q]
      json stars.to_json
    end

    private

    def find_stars(q)
      SearchStars q: q
    end

    def scan_q_for_search(q)
      q.scan(/\p{Han}+|\w+/).each_with_index {|word, index|
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
