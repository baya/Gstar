class AccQStarAssoc < Dun::Activity
  data_reader :q, :star

  set :db, Ground.db

  def call
    assoc = db[:q_star_assocs].where(q: q, star_id: star[:id]).first
    score = star[:tf].to_i
    score = 1 if score = 0
    if assoc
      acc_assoc_score assoc, score
    else
      db[:q_star_assocs].insert(q: q, star_id: star[:id], score: score)
    end
  end

  private

  def acc_assoc_score(assoc, score)
    db[:q_star_assocs].where(id: assoc[:id]).update(score: (assoc[:score] + score) * 2)
  end
  
end
