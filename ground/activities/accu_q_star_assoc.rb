class AccQStarAssoc < Dun::Activity
  data_reader :q, :star

  set :db, Ground.db

  def call
    if assoc
      acc_assoc_score star[:tf].to_i
    else
      db[:q_star_assocs].insert(q: q, star_id: star[:id], score: star[:tf].to_i)
    end
  end

  private

  def assoc
    @assoc ||= db[:q_star_assocs].where(q: q, star_id: star[:id]).first
  end

  def acc_assoc_score(score)
    db[:q_star_assocs].where(id: assoc[:id]).update(score: (assoc[:score] + score) * 2)
  end
  
end
