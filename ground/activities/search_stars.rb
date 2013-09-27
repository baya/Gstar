class SearchStars < Dun::Activity
  data_reader :q

  set :db, Ground.db

  def call
    db[sql, q]
  end

  private

  def sql
    sql = <<-EOF
      select stars.id, stars.full_name, stars.description, stars.html_url, q_star_assocs.score
      from stars
      join q_star_assocs on stars.id = q_star_assocs.star_id
      where q_star_assocs.q = ?
      order by q_star_assocs.score desc
    EOF
  end

end
