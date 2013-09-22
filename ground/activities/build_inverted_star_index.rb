class BuildInvertedStarIndex < Dun::Activity
  data_reader :star

  set :dics_set, Ground.db[:dics]
  set :stars_set, Ground.db[:stars]
  set :dic_star_set, Ground.db[:dic_stars]

  def call
    text = "#{star[:full_name]}\n#{star[:description]}"
    words = text.scan(/\w+/)
    words.each {|word|
      dic = dics_set.where(word: word).first
      if dic.nil?
        dic_id = dics_set.insert word: word 
      else
        dic_id = dic[:id]
      end
      tf = words.count(word)
      dic_star_set.insert(dic_id: dic_id, star_id: star[:id], tf: tf)
    }
  end
  
end
