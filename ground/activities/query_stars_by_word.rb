class QueryStarsByWord < Dun::Activity
  data_reader :word

  set :db, Ground.db

  def call
    db[sql]
  end

  private

  def sql
    dic = db[:dics].where(word: word).first || {}
    sql = <<-EOF
        select stars.full_name, stars.description, stars.html_url, dic_stars.tf, dics.word, stars.id
        from stars
        join dic_stars on stars.id = dic_stars.star_id
        join dics on dic_stars.dic_id = dics.id
        where dics.id = #{dic[:id]}
        order by dic_stars.tf desc
      EOF
  end
  
end
